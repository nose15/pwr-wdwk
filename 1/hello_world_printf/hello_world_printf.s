.section .data
	message: .ascii "Hello World\n"
	msg_len=.-message
	
.section .text
.global main
.extern printf

main:				# when call main -> push %eip ++ (kind of) <- saves the next address as the return addres to which the computer should go after execution
	pushl %ebp 		# save the current base stack frame pointer which is currently in %ebp on top of stack
	movl %esp, %ebp		# use the %ebp as the store for a base of current stack frame pointer which is now in the %esp
				
	pushl $message		# right here the %esp can move freely in this scope
	call printf
	addl $4, %esp	

	mov %ebp, %esp		# move the esp back to the base pointer to save the entry-point of the just called function
	popl %ebp		# pop the previous stack frame pointer from the stack into %ebp
	ret			# take the return address from the stack back to %eip and after function finishes then %eip has the info where to go 
