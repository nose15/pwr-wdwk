.section .data
	message:
	.asciz "Hello World!\n"

.section .text
	.global _start

_start:
	mov $4, %eax
	mov $1, %ebx
	mov $message, %ecx
	mov $14, %edx
	int $0x80

	mov $1, %eax
	int $0x80
