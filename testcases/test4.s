PROCEDURE tigermain
# Before canonicalization: 
MOVE(
 TEMP $v0,
 CALL(
  NAME tigermain.nfactor.0,
   TEMP $fp,
   CONST 10))
# After canonicalization: 
MOVE(
 TEMP $v0,
 CALL(
  NAME tigermain.nfactor.0,
   TEMP $fp,
   CONST 10))
# Basic Blocks: 
#
LABEL L4
MOVE(
 TEMP $v0,
 CALL(
  NAME tigermain.nfactor.0,
   TEMP $fp,
   CONST 10))
JUMP(
 NAME L3)
LABEL L3
# Trace Scheduled: 
LABEL L4
MOVE(
 TEMP $v0,
 CALL(
  NAME tigermain.nfactor.0,
   TEMP $fp,
   CONST 10))
JUMP(
 NAME L3)
LABEL L3
# Instructions: 
L4:
	addu t35 $sp tigermain_framesize
	move $a0 t35
	li t36 10
	move $a1 t36
	jal Tree.NAME@306a30c7

j L3
L3:
END tigermain
PROCEDURE tigermain.nfactor.0
# Before canonicalization: 
MOVE(
 TEMP $v0,
 ESEQ(
  SEQ(
   SEQ(
    CJUMP(EQ,
     TEMP t33,
     CONST 0,
     L0,L1),
    SEQ(
     SEQ(
      LABEL L0,
      SEQ(
       MOVE(
        TEMP t34,
        CONST 1),
       JUMP(
        NAME L2))),
     SEQ(
      LABEL L1,
      SEQ(
       MOVE(
        TEMP t34,
        BINOP(MUL,
         TEMP t33,
         CALL(
          NAME tigermain.nfactor.0,
           MEM(
            BINOP(PLUS,
             TEMP $fp,
             CONST 0)),
           BINOP(MINUS,
            TEMP t33,
            CONST 1)))),
       JUMP(
        NAME L2))))),
   LABEL L2),
  TEMP t34))
# After canonicalization: 
CJUMP(EQ,
 TEMP t33,
 CONST 0,
 L0,L1)
LABEL L0
MOVE(
 TEMP t34,
 CONST 1)
JUMP(
 NAME L2)
LABEL L1
MOVE(
 TEMP t38,
 TEMP t33)
MOVE(
 TEMP t37,
 CALL(
  NAME tigermain.nfactor.0,
   MEM(
    BINOP(PLUS,
     TEMP $fp,
     CONST 0)),
   BINOP(MINUS,
    TEMP t33,
    CONST 1)))
MOVE(
 TEMP t34,
 BINOP(MUL,
  TEMP t38,
  TEMP t37))
JUMP(
 NAME L2)
LABEL L2
MOVE(
 TEMP $v0,
 TEMP t34)
# Basic Blocks: 
#
LABEL L6
CJUMP(EQ,
 TEMP t33,
 CONST 0,
 L0,L1)
#
LABEL L0
MOVE(
 TEMP t34,
 CONST 1)
JUMP(
 NAME L2)
#
LABEL L1
MOVE(
 TEMP t38,
 TEMP t33)
MOVE(
 TEMP t37,
 CALL(
  NAME tigermain.nfactor.0,
   MEM(
    BINOP(PLUS,
     TEMP $fp,
     CONST 0)),
   BINOP(MINUS,
    TEMP t33,
    CONST 1)))
MOVE(
 TEMP t34,
 BINOP(MUL,
  TEMP t38,
  TEMP t37))
JUMP(
 NAME L2)
#
LABEL L2
MOVE(
 TEMP $v0,
 TEMP t34)
JUMP(
 NAME L5)
LABEL L5
# Trace Scheduled: 
LABEL L6
CJUMP(EQ,
 TEMP t33,
 CONST 0,
 L0,L1)
LABEL L1
MOVE(
 TEMP t38,
 TEMP t33)
MOVE(
 TEMP t37,
 CALL(
  NAME tigermain.nfactor.0,
   MEM(
    BINOP(PLUS,
     TEMP $fp,
     CONST 0)),
   BINOP(MINUS,
    TEMP t33,
    CONST 1)))
MOVE(
 TEMP t34,
 BINOP(MUL,
  TEMP t38,
  TEMP t37))
LABEL L2
MOVE(
 TEMP $v0,
 TEMP t34)
JUMP(
 NAME L5)
LABEL L0
MOVE(
 TEMP t34,
 CONST 1)
JUMP(
 NAME L2)
LABEL L5
# Instructions: 
L6:
beqt33, $0, L0
L1:
move t38, t33
	addu t41 $sp tigermain.nfactor.0_framesize
add t40, t41,0
	lw t39 (t40)
	move $a0 t39
sub t42, t33,1
	move $a1 t42
	jal Tree.NAME@5cb0d902
move t37, $v0
mulo t43, t38, t37
move t34, t43
L2:
move $v0, t34
j L5
L0:
	li t44 1
move t34, t44
j L2
L5:
END tigermain.nfactor.0
