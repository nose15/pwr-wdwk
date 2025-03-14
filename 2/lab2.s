.section .data
	num:
		.skip 4
	out_fmt:
		.ascii "%d\n"
	in_fmt:
		.ascii "%d"


.section .text
.global main
.extern printf
.extern scanf
main:
	pushl %ebp
	movl %esp, %ebp
	
	pushl $num
	pushl $in_fmt
	call scanf
	
	addl $8, %esp
	movl num, %eax
	
	# n^3
	imull %eax, %eax
	imull num, %eax		

	# %ebx = res, %eax = num
	movl %eax, %ebx
	movl num, %eax

	# 3*n^2
	imull %eax, %eax
	imull $3, %eax
	
	# %ebx += res, %eax = num
	addl %eax, %ebx
	movl num, %eax
	
	# 2*n
	imull $2, %eax
	addl %eax, %ebx
	movl num, %eax	

	pushl %ebx
	pushl $out_fmt
	call printf
	addl $8, %esp

	mov %ebp, %esp
	popl %ebp

	ret
	
