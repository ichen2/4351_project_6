PROCEDURE tigermain
# Before canonicalization: 
MOVE(
 TEMP $v0,
 ESEQ(
  MOVE(
   TEMP t33,
   CALL(
    NAME _initArray,
     CONST 10,
     CONST 0)),
  ESEQ(
   SEQ(
    MOVE(
     TEMP t34,
     TEMP t33),
    SEQ(
     MOVE(
      TEMP t35,
      CONST 2),
     SEQ(
      CJUMP(LT,
       TEMP t35,
       CONST 0,
       _BADSUB,L0),
      SEQ(
       LABEL L0,
       SEQ(
        CJUMP(GT,
         TEMP t35,
         MEM(
          BINOP(PLUS,
           TEMP t34,
           CONST -4)),
         _BADSUB,L1),
        LABEL L1))))),
   MEM(
    BINOP(PLUS,
     TEMP t34,
     BINOP(MUL,
      TEMP t35,
      CONST 4))))))
# After canonicalization: 
MOVE(
 TEMP t33,
 CALL(
  NAME _initArray,
   CONST 10,
   CONST 0))
MOVE(
 TEMP t34,
 TEMP t33)
MOVE(
 TEMP t35,
 CONST 2)
CJUMP(LT,
 TEMP t35,
 CONST 0,
 _BADSUB,L0)
LABEL L0
CJUMP(GT,
 TEMP t35,
 MEM(
  BINOP(PLUS,
   TEMP t34,
   CONST -4)),
 _BADSUB,L1)
LABEL L1
MOVE(
 TEMP $v0,
 MEM(
  BINOP(PLUS,
   TEMP t34,
   BINOP(MUL,
    TEMP t35,
    CONST 4))))
# Basic Blocks: 
#
LABEL L3
MOVE(
 TEMP t33,
 CALL(
  NAME _initArray,
   CONST 10,
   CONST 0))
MOVE(
 TEMP t34,
 TEMP t33)
MOVE(
 TEMP t35,
 CONST 2)
CJUMP(LT,
 TEMP t35,
 CONST 0,
 _BADSUB,L0)
#
LABEL L0
CJUMP(GT,
 TEMP t35,
 MEM(
  BINOP(PLUS,
   TEMP t34,
   CONST -4)),
 _BADSUB,L1)
#
LABEL L1
MOVE(
 TEMP $v0,
 MEM(
  BINOP(PLUS,
   TEMP t34,
   BINOP(MUL,
    TEMP t35,
    CONST 4))))
JUMP(
 NAME L2)
LABEL L2
# Trace Scheduled: 
LABEL L3
MOVE(
 TEMP t33,
 CALL(
  NAME _initArray,
   CONST 10,
   CONST 0))
MOVE(
 TEMP t34,
 TEMP t33)
MOVE(
 TEMP t35,
 CONST 2)
CJUMP(LT,
 TEMP t35,
 CONST 0,
 _BADSUB,L0)
LABEL L0
CJUMP(GT,
 TEMP t35,
 MEM(
  BINOP(PLUS,
   TEMP t34,
   CONST -4)),
 _BADSUB,L1)
LABEL L1
MOVE(
 TEMP $v0,
 MEM(
  BINOP(PLUS,
   TEMP t34,
   BINOP(MUL,
    TEMP t35,
    CONST 4))))
JUMP(
 NAME L2)
LABEL L2
# Instructions: 
L3:
	li t36 10
	move $a0 t36
	move $a1 $0
	jal Tree.NAME@7eda2dbb
move t33, $v0
move t34, t33
	li t37 2
move t35, t37
bltt35, $0, _BADSUB
L0:
add t39, t34,-4
	lw t38 (t39)
bgtt35, t38, _BADSUB
L1:
mulo t42, t35,4
add t41, t34, t42
	lw t40 (t41)
move $v0, t40
j L2
L2:
END tigermain
