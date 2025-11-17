.data
msg: .ascii "[Assembled x86] Hello, World!\n"
len = . - msg

.text
.global _start

_start:
    # write
    movl $4, %eax        # System call number for sys_write
    movl $1, %ebx        # File descriptor 1 (stdout)
    movl $msg, %ecx      # Address of the string to write
    movl $len, %edx      # Length of the string (including newline)
    int $0x80            # Invoke the kernel

    # exit
    movl $1, %eax       # System call number for sys_exit
    movl $0, %ebx        # Exit code 0 (success)
    int $0x80            # invoke the kernel
