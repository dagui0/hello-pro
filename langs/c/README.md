# C

C 언어는 Unix 운영제제를 개발하는 과정에서 만들어졌으며, 이후 모든 시스템에 포팅되었고 가장 중요한 개발 언어로 자리잡았다.
그리고 50년이 넘는 세월을 시스템 프로그래밍(system programming)의 표준의 위치를 굳건하게 지키고 있다.

```c
#include <stdio.h>

int main(void) {
    printf("[C (Standard)] Hello, World!\n");
    return 0;
}
```

## 예제 목록

* K&R C - 초창기 C 개발 스타일(컴파일은 가능하지만 경고가 많이 뜬다)
    * [hello.c](knr/hello.c)
    * [truth.c](knr/truth.c)
* Standard C
    * [hello.c](std/hello.c)
    * [truth.c](std/truth.c)
    * [echo.c](std/echo.c)

---
## 소개

* 발표일: 1972년
* 개발자: [Dennis Ritchie](https://en.wikipedia.org/wiki/Dennis_Ritchie), [Ken Thompson](https://en.wikipedia.org/wiki/Ken_Thompson)
* 소스 확장자: `.c`
* 헤더 확장자: `.h`

가장 훌륭한 프로그래밍 언어가 무엇인가 이야기한다면 영원히 토론이 끝나지 않겠지만, 가장 위대한 언어, 그러니까 가장 많이 수행되는 코드를 만든 언어가 무엇인가 이야기한다면 1초만에 결론이 날 것이다. 오늘날 수많은 컴퓨터에서 동작하는 모든 기계어의 최소한(아무리 보수적으로 잡아도) 절반은 C언어가 생산한 것이고, 중요하고 자주 호출되는 기반 코드들은 아주 높은 확률로 C로 작성되어 있다.

C언어는 처음에 배우기 쉽지 않지만, 간결하고 표현력이 좋아서 일단 익숙해지면 개발하는 재미가 좋은 편이다. 포인터(Pointer)를 이용해서 메모리 주소를 자유롭게 다룰 수 있기에, 시스템의 저수준(low level)에 직접 접근하여 조작/처리하는 프로그램을 만들 수 있어 시스템 프로그램용 고급 언어으로 분류된다. 학자들에 따라서는 저수준 언어(low level language, assembly)와 고급 언어(high level language)의 경계에 위치해 있다고 설명하기도 한다.

## 역사

C언어의 개발은 Unix 운영체제와 깊이 연관되어 있어서 따로 생각할 수가 없다. C언어의 개발자들이 곧 Unix OS의 개발자이기도 하고, 기본 설계나 구조 자체가 서로에게 깊게 의지하고 있다.

> 계보: ALGOL 60 - CPL (1963) - BCPL (1969) - B (1970, 캔 톰슨) - C (1972, 데니스 리치)

* 켄 톰슨은 PDP-7에서 Unix를 어셈블리로 개발하고 있었는데, 이 시스템에서 사용하고자 BCPL을 축소한 B를 개발.
* Unix를 PDP-11로 이식하기 위해서 B언어의 개량 필요성 대두.
* 데니스 리치는 데이터 타입을 추가하는 등 B를 개량하여 C를 개발.
* 어셈블리로 개발된 Unix 코드의 대부분을 C언어로 다시 작성. (그러면서 C언어 기능도 같이 발전)

### C언어의 표준

현재 C언어의 표준은 ISO산하의 실무 그룹 ISO/IEC JTC1/SC22/WG14에 의해 관리되고 있다.

* K&R C - 브라이언 커니핸과 데니스 리치의 저자 직강 ["The C Programming Language"](https://en.wikipedia.org/wiki/The_C_Programming_Language)을 말하는 것으로, 표준화 이전의 사실상의 표준
* [ANSI C (C89/C90)](https://en.wikipedia.org/wiki/ANSI_C) - ANSI의 규격 C89를 ISO가 C90으로 승인함(C89와 C90은 같은 규격임)
* [C99](https://en.wikipedia.org/wiki/C99) - 자료형 생략 금지(묵시적 `int` 선언 불허), `//` 주석, 가변 길이 배열(VLA) 등
* [C11](https://en.wikipedia.org/wiki/C11_(C_standard_revision)) - 멀티스레딩 표준화(`<threads.h>`), 익명 구조체, 제네릭 등
* [C23](https://en.wikipedia.org/wiki/C23_(C_standard_revision)) - `true`/`false` 키워드, `constexpr`, `typeof` 도입 등

## 주요 컴파일러

* GCC - 오픈소스 및 Linux의 표준 컴파일러. '거의 대부분'이란 말은 겸손한 표현이고, '모든' 환경에서 개발 가능
* Clang/LLVM - GCC 보다 개선된 구조로 개발되는 또 다른 오픈소스 컴파일러
    * GCC의 라이센스(GPL) 문제를 피하기 위해서 Apple, ARM, Google 등 기업체들이 후원하여 급속 성장
* OS 벤더 제공 공식 컴파일러
    * Microsoft Visual C/C++
    * Intel C++ Compiler, Oracle(Sun) Developer Studio 등
