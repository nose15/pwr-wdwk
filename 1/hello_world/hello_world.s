
.section .data
	message:
		.ascii "Hello World\n"
	.global _start	

.section .text
_start:
	mov $4, %eax
	mov $1, %ebx
	mov $message, %ecx
	mov $14, %edx
	int $0x80

	mov $1, %eax
	int $0x80
