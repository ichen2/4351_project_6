PROCEDURE tigermain
# Before canonicalization: 
MOVE(
 TEMP $v0,
 ESEQ(
  MOVE(
   TEMP t33,
   CONST 0),
  ESEQ(
   SEQ(
    CJUMP(EQ,
     TEMP t33,
     CONST 0,
     L0,L0),
    LABEL L0),
   ESEQ(
    SEQ(
     MOVE(
      TEMP t34,
      CONST 1),
     SEQ(
      CJUMP(NE,
       TEMP t33,
       CONST 0,
       L1,L2),
      SEQ(
       LABEL L2,
       SEQ(
        MOVE(
         TEMP t34,
         CONST 0),
        LABEL L1)))),
    TEMP t34))))
# After canonicalization: 
MOVE(
 TEMP t33,
 CONST 0)
CJUMP(EQ,
 TEMP t33,
 CONST 0,
 L0,L0)
LABEL L0
MOVE(
 TEMP t34,
 CONST 1)
CJUMP(NE,
 TEMP t33,
 CONST 0,
 L1,L2)
LABEL L2
MOVE(
 TEMP t34,
 CONST 0)
LABEL L1
MOVE(
 TEMP $v0,
 TEMP t34)
# Basic Blocks: 
#
LABEL L4
MOVE(
 TEMP t33,
 CONST 0)
CJUMP(EQ,
 TEMP t33,
 CONST 0,
 L0,L0)
#
LABEL L0
MOVE(
 TEMP t34,
 CONST 1)
CJUMP(NE,
 TEMP t33,
 CONST 0,
 L1,L2)
#
LABEL L2
MOVE(
 TEMP t34,
 CONST 0)
JUMP(
 NAME L1)
#
LABEL L1
MOVE(
 TEMP $v0,
 TEMP t34)
JUMP(
 NAME L3)
LABEL L3
# Trace Scheduled: 
LABEL L4
MOVE(
 TEMP t33,
 CONST 0)
CJUMP(EQ,
 TEMP t33,
 CONST 0,
 L0,L0)
LABEL L0
MOVE(
 TEMP t34,
 CONST 1)
CJUMP(NE,
 TEMP t33,
 CONST 0,
 L1,L2)
LABEL L2
MOVE(
 TEMP t34,
 CONST 0)
LABEL L1
MOVE(
 TEMP $v0,
 TEMP t34)
JUMP(
 NAME L3)
LABEL L3
# Instructions: 
L4:
move t33, $0
beqt33, $0, L0
L0:
	li t35 1
move t34, t35
bnet33, $0, L1
L2:
move t34, $0
L1:
move $v0, t34
j L3
L3:
END tigermain
