.section .data
	num:
		.skip 4
	out_fmt:
		.ascii "%d\n\0"
	in_fmt:
		.ascii "%d"
	err_msg:
		.ascii "Overflow\n\0"

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
	mov %eax, %ebx	

	# n^3
	imull %eax, %ebx
	jo overflow_detected	
	
	imull %eax, %ebx
	jo overflow_detected

	# 3*n^2
	movl %eax, %edx
	imull %eax, %edx
	jo overflow_detected	

	imull $3, %edx
	jo overflow_detected
	
	# %ebx += res, %eax = num
	addl %edx, %ebx
	jo overflow_detected
	
	# 2*n
	imull $2, %eax
	jo overflow_detected	

	addl %eax, %ebx	
	jo overflow_detected

	pushl %ebx
	pushl $out_fmt
	call printf
	addl $8, %esp	

	jmp end_main

overflow_detected:
	pushl $err_msg
	call printf
	addl $4, %esp

end_main:
	mov %ebp, %esp
	popl %ebp
