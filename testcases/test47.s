PROCEDURE tigermain
# Before canonicalization: 
MOVE(
 TEMP $v0,
 ESEQ(
  MOVE(
   TEMP t33,
   CONST 4),
  CONST 0))
# After canonicalization: 
MOVE(
 TEMP t33,
 CONST 4)
MOVE(
 TEMP $v0,
 CONST 0)
# Basic Blocks: 
#
LABEL L1
MOVE(
 TEMP t33,
 CONST 4)
MOVE(
 TEMP $v0,
 CONST 0)
JUMP(
 NAME L0)
LABEL L0
# Trace Scheduled: 
LABEL L1
MOVE(
 TEMP t33,
 CONST 4)
MOVE(
 TEMP $v0,
 CONST 0)
JUMP(
 NAME L0)
LABEL L0
# Instructions: 
L1:
	li t34 4
move t33, t34
move $v0, $0
j L0
L0:
END tigermain
