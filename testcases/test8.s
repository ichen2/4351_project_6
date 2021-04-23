PROCEDURE tigermain
# Before canonicalization: 
MOVE(
 TEMP $v0,
 ESEQ(
  SEQ(
   SEQ(
    CJUMP(GT,
     CONST 10,
     CONST 20,
     L0,L1),
    SEQ(
     SEQ(
      LABEL L0,
      SEQ(
       MOVE(
        TEMP t33,
        CONST 30),
       JUMP(
        NAME L2))),
     SEQ(
      LABEL L1,
      SEQ(
       MOVE(
        TEMP t33,
        CONST 40),
       JUMP(
        NAME L2))))),
   LABEL L2),
  TEMP t33))
# After canonicalization: 
CJUMP(GT,
 CONST 10,
 CONST 20,
 L0,L1)
LABEL L0
MOVE(
 TEMP t33,
 CONST 30)
JUMP(
 NAME L2)
LABEL L1
MOVE(
 TEMP t33,
 CONST 40)
JUMP(
 NAME L2)
LABEL L2
MOVE(
 TEMP $v0,
 TEMP t33)
# Basic Blocks: 
#
LABEL L4
CJUMP(GT,
 CONST 10,
 CONST 20,
 L0,L1)
#
LABEL L0
MOVE(
 TEMP t33,
 CONST 30)
JUMP(
 NAME L2)
#
LABEL L1
MOVE(
 TEMP t33,
 CONST 40)
JUMP(
 NAME L2)
#
LABEL L2
MOVE(
 TEMP $v0,
 TEMP t33)
JUMP(
 NAME L3)
LABEL L3
# Trace Scheduled: 
LABEL L4
CJUMP(GT,
 CONST 10,
 CONST 20,
 L0,L1)
LABEL L1
MOVE(
 TEMP t33,
 CONST 40)
LABEL L2
MOVE(
 TEMP $v0,
 TEMP t33)
JUMP(
 NAME L3)
LABEL L0
MOVE(
 TEMP t33,
 CONST 30)
JUMP(
 NAME L2)
LABEL L3
# Instructions: 
L4:
	li t34 10
	li t35 20
bgtt34, t35, L0
L1:
	li t36 40
move t33, t36
L2:
move $v0, t33
j L3
L0:
	li t37 30
move t33, t37
j L2
L3:
END tigermain
