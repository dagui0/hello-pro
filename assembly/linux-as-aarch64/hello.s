// hello.s 
.data

msg: .ascii "Hello, World!\n"
len = . - msg

.text
.global _start

_start:
    // write syscall
    mov x8, #64  // syscall number for write (on Linux aarch64)
    mov x0, #1   // file descriptor 1 (stdout)
    adr x1, msg  // address of the message string
    mov x2, len  // length of the message string
    svc #0       // invoke syscall

    // exit syscall
    mov x8, #93  // syscall number for exit (on Linux aarch64)
    mov x0, #0   // exit code 0 (success)
    svc #0       // invoke syscall
