PROCEDURE tigermain
# Before canonicalization: 
SEQ(
 MOVE(
  TEMP t33,
  CONST 0),
 MOVE(
  TEMP t33,
  CONST 0))
# After canonicalization: 
MOVE(
 TEMP t33,
 CONST 0)
MOVE(
 TEMP t33,
 CONST 0)
# Basic Blocks: 
#
LABEL L1
MOVE(
 TEMP t33,
 CONST 0)
MOVE(
 TEMP t33,
 CONST 0)
JUMP(
 NAME L0)
LABEL L0
# Trace Scheduled: 
LABEL L1
MOVE(
 TEMP t33,
 CONST 0)
MOVE(
 TEMP t33,
 CONST 0)
JUMP(
 NAME L0)
LABEL L0
# Instructions: 
L1:
move t33, $0
move t33, $0
j L0
L0:
END tigermain
