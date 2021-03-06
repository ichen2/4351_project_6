package Mips;
import Temp.Temp;
import Temp.TempList;
import Temp.Label;
import Temp.LabelList;
import java.util.Hashtable;

public class Codegen {
  MipsFrame frame;
  public Codegen(MipsFrame f) {frame = f;}

  private Assem.InstrList ilist = null, last = null;

  private void emit(Assem.Instr inst) {
    if (last != null)
      last = last.tail = new Assem.InstrList(inst, null);
    else {
      if (ilist != null)
	      throw new Error("Codegen.emit");
      last = ilist = new Assem.InstrList(inst, null);
    }
  }

  Assem.InstrList codegen(Tree.Stm s) {
    munchStm(s);
    Assem.InstrList l = ilist;
    ilist = last = null;
    return l;
  }

  static Assem.Instr OPER(String a, TempList d, TempList s, LabelList j) {
    return new Assem.OPER("\t" + a, d, s, j);
  }
  static Assem.Instr OPER(String a, TempList d, TempList s) {
    return new Assem.OPER("\t" + a, d, s);
  }
  static Assem.Instr MOVE(String a, Temp d, Temp s) {
    return new Assem.MOVE("\t" + a, d, s);
  }

  static TempList L(Temp h) {
    return new TempList(h, null);
  }
  static TempList L(Temp h, TempList t) {
    return new TempList(h, t);
  }

  void munchStm(Tree.Stm s) {
    if (s instanceof Tree.MOVE) 
      munchStm((Tree.MOVE)s);
    else if (s instanceof Tree.UEXP)
      munchStm((Tree.UEXP)s);
    else if (s instanceof Tree.JUMP)
      munchStm((Tree.JUMP)s);
    else if (s instanceof Tree.CJUMP)
      munchStm((Tree.CJUMP)s);
    else if (s instanceof Tree.LABEL)
      munchStm((Tree.LABEL)s);
    else
      throw new Error("Codegen.munchStm");
  }

  void munchStm(Tree.MOVE s) {
    Temp t = munchExp(s.dst);
    Temp f = munchExp(s.src);
    emit(new Assem.MOVE("move `d0, `s0", t, f));
  }

  void munchStm(Tree.UEXP s) {
    munchExp(s.exp);
  }

  void munchStm(Tree.JUMP s) {
    LabelList tList = s.targets;
    emit(new Assem.OPER("j " + tList.head, null, null, tList));
  }

  private static String[] CJUMP = new String[10];
  static {
    CJUMP[Tree.CJUMP.EQ ] = "beq";
    CJUMP[Tree.CJUMP.NE ] = "bne";
    CJUMP[Tree.CJUMP.LT ] = "blt";
    CJUMP[Tree.CJUMP.GT ] = "bgt";
    CJUMP[Tree.CJUMP.LE ] = "ble";
    CJUMP[Tree.CJUMP.GE ] = "bge";
    CJUMP[Tree.CJUMP.ULT] = "bltu";
    CJUMP[Tree.CJUMP.ULE] = "bleu";
    CJUMP[Tree.CJUMP.UGT] = "bgtu";
    CJUMP[Tree.CJUMP.UGE] = "bgeu";
  }

  void munchStm(Tree.CJUMP s) {
    String op = CJUMP[s.relop];
    Temp left = munchExp(s.left);
    Temp right = munchExp(s.right);
    TempList vList = L(left, L(right));
    LabelList jList = new LabelList(s.iftrue, new LabelList(s.iffalse, null));
    emit(new Assem.OPER(op + "`s0, `s1, `j0", null, vList, jList));
  }

  void munchStm(Tree.LABEL l) {
    emit(new Assem.LABEL(l.label.toString() + ":", l.label));
  }

  Temp munchExp(Tree.Exp s) {
    if (s instanceof Tree.CONST)
      return munchExp((Tree.CONST)s);
    else if (s instanceof Tree.NAME)
      return munchExp((Tree.NAME)s);
    else if (s instanceof Tree.TEMP)
      return munchExp((Tree.TEMP)s);
    else if (s instanceof Tree.BINOP)
      return munchExp((Tree.BINOP)s);
    else if (s instanceof Tree.MEM)
      return munchExp((Tree.MEM)s);
    else if (s instanceof Tree.CALL)
      return munchExp((Tree.CALL)s);
    else
      throw new Error("Codegen.munchExp");
  }

  Temp munchExp(Tree.CONST e) {
    if(e.value == 0) {
      return frame.ZERO;
    }
    Temp t = new Temp();
    emit(OPER("li `d0 " + e.value, L(t), null));
    return t;
  }

  Temp munchExp(Tree.NAME e) {
    Temp t = new Temp();
    emit(OPER("la `d0 " + e.label.toString(), L(t), null));
    return t;
  }

  Temp munchExp(Tree.TEMP e) {
    if (e.temp == frame.FP) {
      Temp t = new Temp();
      emit(OPER("addu `d0 `s0 " + frame.name + "_framesize",
		L(t), L(frame.SP)));
      return t;
    }
    return e.temp;
  }

  private static String[] BINOP = new String[10];
  static {
    BINOP[Tree.BINOP.PLUS   ] = "add";
    BINOP[Tree.BINOP.MINUS  ] = "sub";
    BINOP[Tree.BINOP.MUL    ] = "mulo";
    BINOP[Tree.BINOP.DIV    ] = "div";
    BINOP[Tree.BINOP.AND    ] = "and";
    BINOP[Tree.BINOP.OR     ] = "or";
    BINOP[Tree.BINOP.LSHIFT ] = "sll";
    BINOP[Tree.BINOP.RSHIFT ] = "srl";
    BINOP[Tree.BINOP.ARSHIFT] = "sra";
    BINOP[Tree.BINOP.XOR    ] = "xor";
  }

  private static int shift(int i) {
    int shift = 0;
    if ((i >= 2) && ((i & (i - 1)) == 0)) {
      while (i > 1) {
        shift += 1;
        i >>= 1;
      }
    }
    return shift;
  }

  // possible bugs here
  Temp munchExp(Tree.BINOP e) {
    if(e.left instanceof Tree.CONST && e.right instanceof Tree.CONST) {
      Temp t = new Temp();
      TempList tList = L(t);
      String op = BINOP[e.binop];        
      emit(new Assem.OPER(op + " `d0," + ((Tree.CONST) e.left).value +  "," + ((Tree.CONST) e.right).value, tList, null));
      return t;
    }
    else if(e.right instanceof Tree.CONST) {
      Temp t = new Temp();
      TempList tList = L(t);
      String op = BINOP[e.binop];
      Temp lTemp = munchExp(e.left);
      TempList opList = L(lTemp);
      emit(new Assem.OPER(op + " `d0, `s0," + ((Tree.CONST) e.right).value, tList, opList));
      return t;
    }
    else if(e.left instanceof Tree.CONST) {
      Temp t = new Temp();
      TempList tList = L(t);
      String op = BINOP[e.binop];
      Temp rTemp = munchExp(e.right);
      TempList opList = L(rTemp);
      emit(new Assem.OPER(op + " `d0," + ((Tree.CONST) e.left).value + ", `s0", tList, opList));
      return t;
    }
    else {
      Temp t = new Temp();
      TempList tList = L(t);
      String op = BINOP[e.binop];
      Temp left = munchExp(e.left);
      Temp right = munchExp(e.right);
      TempList opList = L(left, L(right, null));
      emit(new Assem.OPER(op + " `d0, `s0, `s1", tList, opList));
      return t;
    }
  }

  Temp munchExp(Tree.MEM e) {
    Temp t = new Temp();
    if(e.exp instanceof Tree.CONST) {
      emit(OPER("lw `d0 " + ((Tree.CONST) e.exp).value, L(t), null));
      return t;
    }
    else {
      emit(OPER("lw `d0 (`s0)", L(t), L(munchExp(e.exp))));
    }
    return t;
  }

  Temp munchExp(Tree.CALL s) {
    if(s.func instanceof Tree.NAME) {
      emit(OPER("jal " + s.func,  frame.calldefs, munchArgs(0, s.args)));
    }
    else {
      emit(OPER("jal `d0 `s0", frame.calldefs, L(munchExp(s.func), munchArgs(0, s.args))));
    }
    return frame.V0;
  }

  private TempList munchArgs(int i, Tree.ExpList args) {
    if (args == null)
      return null;
    Temp src = munchExp(args.head);
    if (i > frame.maxArgs)
      frame.maxArgs = i;
    switch (i) {
    case 0:
      emit(MOVE("move `d0 `s0", frame.A0, src));
      break;
    case 1:
      emit(MOVE("move `d0 `s0", frame.A1, src));
      break;
    case 2:
      emit(MOVE("move `d0 `s0", frame.A2, src));
      break;
    case 3:
      emit(MOVE("move `d0 `s0", frame.A3, src));
      break;
    default:
      emit(OPER("sw `s0 " + (i-1)*frame.wordSize() + "(`s1)",
		    null, L(src, L(frame.SP))));
      break;
    }
    return L(src, munchArgs(i+1, args.tail));
  }
}
