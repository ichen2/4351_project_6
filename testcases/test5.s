PROCEDURE tigermain
# Before canonicalization: 
MOVE(
 TEMP $v0,
 ESEQ(
  MOVE(
   TEMP t34,
   ESEQ(
    SEQ(
     MOVE(
      TEMP t33,
      CALL(
       NAME _allocRecord,
        CONST 2)),
     SEQ(
      MOVE(
       MEM(
        BINOP(PLUS,
         TEMP t33,
         CONST 0)),
       CONST 0),
      MOVE(
       MEM(
        BINOP(PLUS,
         TEMP t33,
         CONST 4)),
       CONST 0))),
    TEMP t33)),
  TEMP t34))
# After canonicalization: 
MOVE(
 TEMP t33,
 CALL(
  NAME _allocRecord,
   CONST 2))
MOVE(
 MEM(
  BINOP(PLUS,
   TEMP t33,
   CONST 0)),
 CONST 0)
MOVE(
 MEM(
  BINOP(PLUS,
   TEMP t33,
   CONST 4)),
 CONST 0)
MOVE(
 TEMP t34,
 TEMP t33)
MOVE(
 TEMP $v0,
 TEMP t34)
# Basic Blocks: 
#
LABEL L1
MOVE(
 TEMP t33,
 CALL(
  NAME _allocRecord,
   CONST 2))
MOVE(
 MEM(
  BINOP(PLUS,
   TEMP t33,
   CONST 0)),
 CONST 0)
MOVE(
 MEM(
  BINOP(PLUS,
   TEMP t33,
   CONST 4)),
 CONST 0)
MOVE(
 TEMP t34,
 TEMP t33)
MOVE(
 TEMP $v0,
 TEMP t34)
JUMP(
 NAME L0)
LABEL L0
# Trace Scheduled: 
LABEL L1
MOVE(
 TEMP t33,
 CALL(
  NAME _allocRecord,
   CONST 2))
MOVE(
 MEM(
  BINOP(PLUS,
   TEMP t33,
   CONST 0)),
 CONST 0)
MOVE(
 MEM(
  BINOP(PLUS,
   TEMP t33,
   CONST 4)),
 CONST 0)
MOVE(
 TEMP t34,
 TEMP t33)
MOVE(
 TEMP $v0,
 TEMP t34)
JUMP(
 NAME L0)
LABEL L0
# Instructions: 
L1:
	li t35 2
	move $a0 t35
	jal Tree.NAME@76fb509a
move t33, $v0
add t37, t33,0
	lw t36 (t37)
move t36, $0
add t39, t33,4
	lw t38 (t39)
move t38, $0
move t34, t33
move $v0, t34
j L0
L0:
END tigermain
