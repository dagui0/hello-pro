.data
msg: .asciz "[Assembled x86_64] Hello, World!\n"
.equ len, . - msg

.text
.global _start

_start:
    # sys_write (syscall number 1)
    mov $1, %rax        # System call number for sys_write
    mov $1, %rdi        # File descriptor 1 (stdout)
    lea msg(%rip), %rsi # Address of the string to write
    mov $len, %rdx      # Length of the string (including newline)
    syscall             # Invoke the kernel

    # sys_exit (syscall number 60)
    mov $60, %rax       # System call number for sys_exit
    xor %rdi, %rdi      # Exit code 0 (success)
    syscall             # invoke the kernel
