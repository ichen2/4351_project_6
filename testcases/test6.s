PROCEDURE tigermain
# Before canonicalization: 
EXP(
 CALL(
  NAME tigermain.do_nothing1.1,
   TEMP $fp,
   CONST 0,
   NAME L1))
# After canonicalization: 
EXP(
 CALL(
  NAME tigermain.do_nothing1.1,
   TEMP $fp,
   CONST 0,
   NAME L1))
# Basic Blocks: 
#
LABEL L3
EXP(
 CALL(
  NAME tigermain.do_nothing1.1,
   TEMP $fp,
   CONST 0,
   NAME L1))
JUMP(
 NAME L2)
LABEL L2
# Trace Scheduled: 
LABEL L3
EXP(
 CALL(
  NAME tigermain.do_nothing1.1,
   TEMP $fp,
   CONST 0,
   NAME L1))
JUMP(
 NAME L2)
LABEL L2
# Instructions: 
L3:
	addu t37 $sp tigermain_framesize
	move $a0 t37
	move $a1 $0
	la t38 L1
	move $a2 t38
	jal Tree.NAME@4629104a
j L2
L2:
END tigermain
	.data
	.word 4
L1:	.asciiz	"str2"
PROCEDURE tigermain.do_nothing2.0
# Before canonicalization: 
EXP(
 CALL(
  NAME tigermain.do_nothing1.1,
   TEMP t33,
   TEMP t34,
   NAME L0))
# After canonicalization: 
EXP(
 CALL(
  NAME tigermain.do_nothing1.1,
   TEMP t33,
   TEMP t34,
   NAME L0))
# Basic Blocks: 
#
LABEL L5
EXP(
 CALL(
  NAME tigermain.do_nothing1.1,
   TEMP t33,
   TEMP t34,
   NAME L0))
JUMP(
 NAME L4)
LABEL L4
# Trace Scheduled: 
LABEL L5
EXP(
 CALL(
  NAME tigermain.do_nothing1.1,
   TEMP t33,
   TEMP t34,
   NAME L0))
JUMP(
 NAME L4)
LABEL L4
# Instructions: 
L5:
	move $a0 t33
	move $a1 t34
	la t39 L0
	move $a2 t39
	jal Tree.NAME@1cf4f579
j L4
L4:
END tigermain.do_nothing2.0
	.data
	.word 3
L0:	.asciiz	"str"
PROCEDURE tigermain.do_nothing1.1
# Before canonicalization: 
EXP(
 CALL(
  NAME tigermain.do_nothing2.0,
   MEM(
    BINOP(PLUS,
     TEMP $fp,
     CONST 0)),
   BINOP(PLUS,
    TEMP t35,
    CONST 1)))
# After canonicalization: 
EXP(
 CALL(
  NAME tigermain.do_nothing2.0,
   MEM(
    BINOP(PLUS,
     TEMP $fp,
     CONST 0)),
   BINOP(PLUS,
    TEMP t35,
    CONST 1)))
# Basic Blocks: 
#
LABEL L7
EXP(
 CALL(
  NAME tigermain.do_nothing2.0,
   MEM(
    BINOP(PLUS,
     TEMP $fp,
     CONST 0)),
   BINOP(PLUS,
    TEMP t35,
    CONST 1)))
JUMP(
 NAME L6)
LABEL L6
# Trace Scheduled: 
LABEL L7
EXP(
 CALL(
  NAME tigermain.do_nothing2.0,
   MEM(
    BINOP(PLUS,
     TEMP $fp,
     CONST 0)),
   BINOP(PLUS,
    TEMP t35,
    CONST 1)))
JUMP(
 NAME L6)
LABEL L6
# Instructions: 
L7:
	addu t42 $sp tigermain.do_nothing1.1_framesize
add t41, t42,0
	lw t40 (t41)
	move $a0 t40
add t43, t35,1
	move $a1 t43
	jal Tree.NAME@7506e922
j L6
L6:
END tigermain.do_nothing1.1
