PROCEDURE tigermain
# Before canonicalization: 
MOVE(
 TEMP $v0,
 CALL(
  NAME tigermain.do_nothing1.1,
   TEMP $fp,
   CONST 0,
   NAME L2))
# After canonicalization: 
MOVE(
 TEMP $v0,
 CALL(
  NAME tigermain.do_nothing1.1,
   TEMP $fp,
   CONST 0,
   NAME L2))
# Basic Blocks: 
#
LABEL L4
MOVE(
 TEMP $v0,
 CALL(
  NAME tigermain.do_nothing1.1,
   TEMP $fp,
   CONST 0,
   NAME L2))
JUMP(
 NAME L3)
LABEL L3
# Trace Scheduled: 
LABEL L4
MOVE(
 TEMP $v0,
 CALL(
  NAME tigermain.do_nothing1.1,
   TEMP $fp,
   CONST 0,
   NAME L2))
JUMP(
 NAME L3)
LABEL L3
# Instructions: 
L4:
	addu t37 $sp tigermain_framesize
	move $a0 t37
	move $a1 $0
	la t38 L2
	move $a2 t38
	jal Tree.NAME@4d76f3f8

j L3
L3:
END tigermain
	.data
	.word 4
L2:	.asciiz	"str2"
PROCEDURE tigermain.do_nothing2.0
# Before canonicalization: 
MOVE(
 TEMP $v0,
 ESEQ(
  EXP(
   CALL(
    NAME tigermain.do_nothing1.1,
     TEMP t33,
     TEMP t34,
     NAME L0)),
  NAME L1))
# After canonicalization: 
EXP(
 CALL(
  NAME tigermain.do_nothing1.1,
   TEMP t33,
   TEMP t34,
   NAME L0))
MOVE(
 TEMP $v0,
 NAME L1)
# Basic Blocks: 
#
LABEL L6
EXP(
 CALL(
  NAME tigermain.do_nothing1.1,
   TEMP t33,
   TEMP t34,
   NAME L0))
MOVE(
 TEMP $v0,
 NAME L1)
JUMP(
 NAME L5)
LABEL L5
# Trace Scheduled: 
LABEL L6
EXP(
 CALL(
  NAME tigermain.do_nothing1.1,
   TEMP t33,
   TEMP t34,
   NAME L0))
MOVE(
 TEMP $v0,
 NAME L1)
JUMP(
 NAME L5)
LABEL L5
# Instructions: 
L6:
	move $a0 t33
	move $a1 t34
	la t39 L0
	move $a2 t39
	jal Tree.NAME@4ee285c6
	la t40 L1
move $v0, t40
j L5
L5:
END tigermain.do_nothing2.0
	.data
	.word 1
L1:	.asciiz	" "
	.data
	.word 3
L0:	.asciiz	"str"
PROCEDURE tigermain.do_nothing1.1
# Before canonicalization: 
MOVE(
 TEMP $v0,
 ESEQ(
  EXP(
   CALL(
    NAME tigermain.do_nothing2.0,
     MEM(
      BINOP(PLUS,
       TEMP $fp,
       CONST 0)),
     BINOP(PLUS,
      TEMP t35,
      CONST 1))),
  CONST 0))
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
MOVE(
 TEMP $v0,
 CONST 0)
# Basic Blocks: 
#
LABEL L8
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
MOVE(
 TEMP $v0,
 CONST 0)
JUMP(
 NAME L7)
LABEL L7
# Trace Scheduled: 
LABEL L8
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
MOVE(
 TEMP $v0,
 CONST 0)
JUMP(
 NAME L7)
LABEL L7
# Instructions: 
L8:
	addu t43 $sp tigermain.do_nothing1.1_framesize
add t42, t43,0
	lw t41 (t42)
	move $a0 t41
add t44, t35,1
	move $a1 t44
	jal Tree.NAME@15327b79
move $v0, $0
j L7
L7:
END tigermain.do_nothing1.1
