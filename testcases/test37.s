PROCEDURE tigermain
# Before canonicalization: 
MOVE(
 TEMP $v0,
 ESEQ(
  SEQ(
   MOVE(
    TEMP t33,
    CONST 0),
   MOVE(
    TEMP t34,
    NAME L0)),
  CONST 0))
# After canonicalization: 
MOVE(
 TEMP t33,
 CONST 0)
MOVE(
 TEMP t34,
 NAME L0)
MOVE(
 TEMP $v0,
 CONST 0)
# Basic Blocks: 
#
LABEL L2
MOVE(
 TEMP t33,
 CONST 0)
MOVE(
 TEMP t34,
 NAME L0)
MOVE(
 TEMP $v0,
 CONST 0)
JUMP(
 NAME L1)
LABEL L1
# Trace Scheduled: 
LABEL L2
MOVE(
 TEMP t33,
 CONST 0)
MOVE(
 TEMP t34,
 NAME L0)
MOVE(
 TEMP $v0,
 CONST 0)
JUMP(
 NAME L1)
LABEL L1
# Instructions: 
L2:
move t33, $0
	la t35 L0
move t34, t35
move $v0, $0
j L1
L1:
END tigermain
	.data
	.word 1
L0:	.asciiz	" "
