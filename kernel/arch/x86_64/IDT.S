# IDT.S - Summit OS
# Interrupt Descriptor Table
# Marcelino Coll Rovira


.macro gate index, handler
	movl \handler, %eax
	mov %eax, idt_start+\index*16
	movw $0x10, idt_start+\index*16+2
	movw $0x8e00, idt_start+\index*16+4
	shr $16, %eax
	mov %eax, idt_start+\index*16+6
	shr $16, %eax
	mov %eax, idt_start+\index*16+8
.endm


.section .boot
int_handler:
	xchg %bx, %bx
	# movl $0x123abc, 0xC03FF000
	iret


.section .boot
.globl 	idt_setup
.type	idt_setup, @function
idt_setup:
	gate 0, $int_handler
	gate 1, $int_handler
	gate 2, $int_handler
	gate 3, $int_handler
	gate 4, $int_handler
	gate 5, $int_handler
	gate 6, $int_handler
	gate 7, $int_handler
	gate 8, $int_handler
	gate 9, $int_handler
	gate 10, $int_handler
	gate 11, $int_handler
	gate 12, $int_handler
	gate 13, $int_handler
	gate 14, $int_handler
	gate 15, $int_handler
	gate 16, $int_handler
	gate 17, $int_handler
	gate 18, $int_handler
	gate 19, $int_handler
	gate 20, $int_handler
	gate 21, $int_handler
	gate 22, $int_handler
	gate 23, $int_handler
	gate 24, $int_handler
	gate 25, $int_handler
	gate 26, $int_handler
	gate 27, $int_handler
	gate 28, $int_handler
	gate 29, $int_handler
	gate 30, $int_handler
	gate 31, $int_handler
	ret


.section .boot
.p2align 4
idt_start:
	.skip 50*16	


.globl idt_info
idt_info:
	.word idt_info - idt_start - 1
	.long idt_start
