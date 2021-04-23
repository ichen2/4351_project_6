PROCEDURE tigermain
# Before canonicalization: 
SEQ(
 MOVE(
  TEMP t33,
  CONST 0),
 SEQ(
  SEQ(
   SEQ(
    SEQ(
     MOVE(
      TEMP t34,
      CONST 0),
     MOVE(
      TEMP t35,
      CONST 100)),
    CJUMP(LE,
     TEMP t34,
     TEMP t35,
     L1,L0)),
   SEQ(
    SEQ(
     SEQ(
      LABEL L1,
      MOVE(
       TEMP t33,
       BINOP(PLUS,
        TEMP t33,
        CONST 1))),
     CJUMP(LT,
      TEMP t34,
      TEMP t35,
      L2,L0)),
    SEQ(
     SEQ(
      LABEL L2,
      MOVE(
       TEMP t34,
       BINOP(PLUS,
        TEMP t34,
        CONST 1))),
     JUMP(
      NAME L1)))),
  LABEL L0))
# After canonicalization: 
MOVE(
 TEMP t33,
 CONST 0)
MOVE(
 TEMP t34,
 CONST 0)
MOVE(
 TEMP t35,
 CONST 100)
CJUMP(LE,
 TEMP t34,
 TEMP t35,
 L1,L0)
LABEL L1
MOVE(
 TEMP t33,
 BINOP(PLUS,
  TEMP t33,
  CONST 1))
CJUMP(LT,
 TEMP t34,
 TEMP t35,
 L2,L0)
LABEL L2
MOVE(
 TEMP t34,
 BINOP(PLUS,
  TEMP t34,
  CONST 1))
JUMP(
 NAME L1)
LABEL L0
# Basic Blocks: 
#
LABEL L4
MOVE(
 TEMP t33,
 CONST 0)
MOVE(
 TEMP t34,
 CONST 0)
MOVE(
 TEMP t35,
 CONST 100)
CJUMP(LE,
 TEMP t34,
 TEMP t35,
 L1,L0)
#
LABEL L1
MOVE(
 TEMP t33,
 BINOP(PLUS,
  TEMP t33,
  CONST 1))
CJUMP(LT,
 TEMP t34,
 TEMP t35,
 L2,L0)
#
LABEL L2
MOVE(
 TEMP t34,
 BINOP(PLUS,
  TEMP t34,
  CONST 1))
JUMP(
 NAME L1)
#
LABEL L0
JUMP(
 NAME L3)
LABEL L3
# Trace Scheduled: 
LABEL L4
MOVE(
 TEMP t33,
 CONST 0)
MOVE(
 TEMP t34,
 CONST 0)
MOVE(
 TEMP t35,
 CONST 100)
CJUMP(LE,
 TEMP t34,
 TEMP t35,
 L1,L0)
LABEL L0
JUMP(
 NAME L3)
LABEL L1
MOVE(
 TEMP t33,
 BINOP(PLUS,
  TEMP t33,
  CONST 1))
CJUMP(GE,
 TEMP t34,
 TEMP t35,
 L0,L2)
LABEL L2
MOVE(
 TEMP t34,
 BINOP(PLUS,
  TEMP t34,
  CONST 1))
JUMP(
 NAME L1)
LABEL L3
# Instructions: 
L4:
move t33, $0
move t34, $0
	li t36 100
move t35, t36
blet34, t35, L1
L0:
j L3
L1:
add t37, t33,1
move t33, t37
bget34, t35, L0
L2:
add t38, t34,1
move t34, t38
j L1
L3:
END tigermain
