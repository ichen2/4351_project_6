PROCEDURE tigermain
# Before canonicalization: 
MOVE(
 TEMP $v0,
 ESEQ(
  MOVE(
   TEMP t33,
   CONST 0),
  CALL(
   NAME tigermain.g.0,
    TEMP $fp,
    CONST 2)))
# After canonicalization: 
MOVE(
 TEMP t33,
 CONST 0)
MOVE(
 TEMP $v0,
 CALL(
  NAME tigermain.g.0,
   TEMP $fp,
   CONST 2))
# Basic Blocks: 
#
LABEL L1
MOVE(
 TEMP t33,
 CONST 0)
MOVE(
 TEMP $v0,
 CALL(
  NAME tigermain.g.0,
   TEMP $fp,
   CONST 2))
JUMP(
 NAME L0)
LABEL L0
# Trace Scheduled: 
LABEL L1
MOVE(
 TEMP t33,
 CONST 0)
MOVE(
 TEMP $v0,
 CALL(
  NAME tigermain.g.0,
   TEMP $fp,
   CONST 2))
JUMP(
 NAME L0)
LABEL L0
# Instructions: 
L1:
move t33, $0
	addu t36 $sp tigermain_framesize
	move $a0 t36
	li t37 2
	move $a1 t37
	jal Tree.NAME@7a07c5b4

j L0
L0:
END tigermain
PROCEDURE tigermain.g.0
# Before canonicalization: 
MOVE(
 TEMP $v0,
 TEMP t35)
# After canonicalization: 
MOVE(
 TEMP $v0,
 TEMP t35)
# Basic Blocks: 
#
LABEL L3
MOVE(
 TEMP $v0,
 TEMP t35)
JUMP(
 NAME L2)
LABEL L2
# Trace Scheduled: 
LABEL L3
MOVE(
 TEMP $v0,
 TEMP t35)
JUMP(
 NAME L2)
LABEL L2
# Instructions: 
L3:
move $v0, t35
j L2
L2:
END tigermain.g.0
