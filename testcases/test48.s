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
PROCEDURE tigermain.g.1
# Before canonicalization: 
MOVE(
 TEMP $v0,
 TEMP t36)
# After canonicalization: 
MOVE(
 TEMP $v0,
 TEMP t36)
# Basic Blocks: 
#
LABEL L3
MOVE(
 TEMP $v0,
 TEMP t36)
JUMP(
 NAME L2)
LABEL L2
# Trace Scheduled: 
LABEL L3
MOVE(
 TEMP $v0,
 TEMP t36)
JUMP(
 NAME L2)
LABEL L2
# Instructions: 
L3:
move $v0, t36
j L2
L2:
END tigermain.g.1
PROCEDURE tigermain.g.0
# Before canonicalization: 
MOVE(
 TEMP $v0,
 TEMP t34)
# After canonicalization: 
MOVE(
 TEMP $v0,
 TEMP t34)
# Basic Blocks: 
#
LABEL L5
MOVE(
 TEMP $v0,
 TEMP t34)
JUMP(
 NAME L4)
LABEL L4
# Trace Scheduled: 
LABEL L5
MOVE(
 TEMP $v0,
 TEMP t34)
JUMP(
 NAME L4)
LABEL L4
# Instructions: 
L5:
move $v0, t34
j L4
L4:
END tigermain.g.0
