# Assembly Language

어셈블리 언어(Assembly Language)란 기계어(Machine Language)를 사람이 읽기 쉬운 형태로 표기해 놓은 것으로 심볼 기계어(Symbolic Machine Language)라고도 한다. 자체적인 철학과 체계를 갖추고 있는 프로그래밍 언어라기 보다는, 기계어의 철학을 그대로 따르는 사실상의 '기계어(Machine Language)의 다른 표기법'이라고 할 수 있다.

```
.data
msg: .asciz "[Assembly (as/linux/x86_64)] Hello, World!\n"
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
```

## 어셈블러/플랫폼 목록

* `as` - Unix의 표준 어셈블러
    * Linux
        * `aarch64`: [hello.s](as/linux/aarch64/hello.s)
        * `x86_64`: [hello.s](as/linux/x86_64/hello.s)
        * `x86`: [hello.s](as/linux/x86/hello.s)

---
## 소개

* 소스 확장자: `.s`, `.asm`

어셈블러(Assembler)는 어셈블리 언어로 작성된 코드를 기계어로 바꿔주는 프로그램으로,
기본적으로 어셈블리 명령과 기계어 명령은 1:1로 대응하므로 언어를 번역하는 것이 아니고
표기를 바꿔쓰는 것에 비유할 수 있다. 따라서 언어를 번역하는 컴파일러(Compiler)와는 구분해서 어셈블러라고 한다.

기계어는 CPU의 개발사와 모델에 따라서 다 다르므로, 어셈블리 코드는 특정 하드웨어만을 위한 코드일 수 밖에 없다.
그리고 프로그램은 OS의 기능(System Call)을 호출하는데, 이 또한 OS마다 방식이 다 다르므로 특정 OS에 종속적이게 된다.
게다가 언어 문법도 표준화가 안되어 있어서, 어셈블러 제품마다 문법이 다르다.

어셈블리 언어로 개발을 하기 위해서는 CPU의 구조와 동작 방식에 대해서 제대로 이해하고 있어야하므로 매우 어렵다.
그리고 CPU, OS, 어셈블러에 종속적이기 때문에 이식성이 거의 0에 수렴한다. 그래서 생산성이 매우 낮을 수 밖에 없다.

일반적인 프로그램 개발에서는 처음부터 어셈블리 언어로 개발하는 경우는 없고,
개발이 완료된 이후에 병목이 발생하는 부분의 최적화를 위해서 어셈블리 언어로 다시 쓰는 경우가 대부분이다.

* OS 커널의 가장 밑바닥 부분 (부트로더, 컨텍스트 스위칭 등)
* 임베디드 시스템 제어
* 성능 최적화가 극도로 필요한 병목 구간 튜닝
* 바이너리 리버스 엔지니어링 및 분석

### 인텔 계열 문법

```
// as/linux/aarch64/hello.s 중에서

    mov x8, #64  // syscall number for write (on Linux aarch64)
```

* `명령어 [목적지], [소스]` 형식
* 레지스터나 상수에 특수 기호를 쓰지 않음 (ARM에서는 상수에 `#` 사용)
* 메모리 주소는 `[ ]`(대괄호)를 사용
* 인텔에서 처음 사용한 문법으로 주로 DOS, Windows 계열에서 많이 사용 (`masm`, `tasm`, `nasm` 등)

### AT&T 계열 문법

```
# as/linux/x86_64/hello.s 중에서

    mov $1, %rax        # System call number for sys_write
```

* `명령어 (소스), (목적지)` 형식
* 레지스터(`%`), 상수(`$`) 등 고유 기호가 있음
* 메모리 주소는 `( )`(소괄호)를 사용
* AT&T 벨 연구소에서 Unix를 만들 때 사용한 문법으로, Unix/Linux의 `as`의 문법

