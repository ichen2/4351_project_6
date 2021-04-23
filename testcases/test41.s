PROCEDURE tigermain
# Before canonicalization: 
MOVE(
 TEMP $v0,
 CONST 0)
# After canonicalization: 
MOVE(
 TEMP $v0,
 CONST 0)
# Basic Blocks: 
#
LABEL L1
MOVE(
 TEMP $v0,
 CONST 0)
JUMP(
 NAME L0)
LABEL L0
# Trace Scheduled: 
LABEL L1
MOVE(
 TEMP $v0,
 CONST 0)
JUMP(
 NAME L0)
LABEL L0
# Instructions: 
L1:
move $v0, $0
j L0
L0:
END tigermain
