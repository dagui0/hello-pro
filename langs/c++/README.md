# C++

C언어처럼 시스템 저수준 접근이 가능하면서 동시에 객체지향 프로그래밍(Object-Oriented Programming)을 위한 다양한 기능을 제공해서 대규모 개발 프로젝트에 적합하다. Windows를 비롯한 GUI(Graphic User Interface)개발, 게임 등에 가장 많이 사용되어 왔고 지금도 사용되고 있다.

```c++
#include <iostream>

int main(void) {
    std::cout << "[C++ (Standard)] Hello, world!" << std::endl;
    return 0;
}
```

## 예제 목록

* Standard C++
    * [hello.cpp](std/hello.cpp)
    * [truth.cpp](std/truth.cpp)

---
## 소개

* 발표일: 1985년
* 개발자: [Bjarne Stroustrup](https://en.wikipedia.org/wiki/Bjarne_Stroustrup)
* 소스 확장자: `.cpp`, `.cc`, `.cxx`
    * 한때 사용되었으나 사장된: `.C`(대문자), `.c++`, `.cp`
* 헤더 확장자: `.hpp`, `.h`

가장 위대한(가장 많이 실행되는) 언어가 C라면, C++은 두번째로 위대한 언어이다. 세상의 모든 코드의 절반이 C로 작성되었다고 가정한다면, 비슷한 방식으로 추정하면 나머지 절반의 절반은 C++로 작성되었다고 봐도 무방할 것이다.

C++는 C언어의 저수준 접근과 유연함 등을 모두 가지면서도 동시에 클래스(Class), 상속(Inheritance), 다형성(Polymorphism) 등의 객체 지향 개발(OOP)용 기능과 제네릭(Generic) 등 고급 기능들 지원한다. 당시로서는 완전체 언어라고 할 수 있었지만, 치명적인 단점이 하나 있었는데, 그것은 언어의 규칙이 너무 많고 복잡해서, 배우기가 매우 어렵다는 것이었다.

게다가 객체지향 프로그래밍은 Windows를 비롯하여 당시에 떠오르던 GUI(Graphic User Interface) 개발에 필수라고 여겨졌기 때문에, C++을 배운다는 것은 곧 GUI를 배운다는 것이었고, 이는 복잡한 언어의 규칙 뿐만 아니라 GUI 프레임워크(MFC 등)를 위한 수많은 객체와 시스템의 기반 정보를 함께 외워야 하는 것이라서 그 어려움은 몇배로 뻥튀기 되었다.

물론 GUI만을 위한 것은 아니고 잘 설계된 객체 구조는 대규모 프로젝트에 도움이 되므로, 일정 규모 이상의 대형 프로젝트는 C++로 개발되는 경우가 많다. 심지어 C 컴파일러인 GCC에도 C++로된 코드가 매우 많은데, C++이 없이는 C를 개발할 수 없는 상황이 되었다고 할 수 있다.

## 역사

개발자인 비야네 스트롭스트룹(Bjarne Stroustrup)은 덴마크 사람으로, 처음에 "C with Classes"라는 이름으로 개발을 하였으나 후에 C++로 변경되었다.(증가 연산자 `++` 향상된 C라는 의미)

처음 출시 당시에는 C코드를 생성하는 생성기와 C컴파일러로 컴파일되는 구조여서, 100% C와 호환되는 구조였다. 그러나 이후에는 C++ 컴파일러가 개발되어서 대부분 C와 호환되지만 100%는 것은 아니다. 다만 `const` 같이 C++의 기능이 C로 역수입된 경우도 있고, 서로 호환성을 어느 정도 유지하면서 발전하는 중이라고 생각하면 될듯 하다.

### 표준화

* C++98 - 최초의 표준. 템플릿과 STL(Standard Template Library)
* C++11 - Modern C++의 시작. `auto` 키워드, 람다(Lambda) 표현식, 스마트 포인터, 멀티스레딩 지원 등 대격변
* C++20 - 모듈(Modules, 헤더 파일 대체), 콘셉트(Concepts, 템플릿 제약), 코루틴(Coroutines), 레인지(Ranges) 도입. 두번째 대격변
* C++23 - `std::print` (`printf`보다 편하고 안전한 출력), 모듈 표준 라이브러리(`import std`), this 매개변수 명시 등.

## 주요 컴파일러

* [C 컴파일러](../c/README.md#주요-컴파일러)가 C만 지원하는 경우는 없고 모두 C++ 컴파일러를 포함하고 있다.
* GUI 개발이 중요한 용도이다보니, 컴파일러 뿐만 아니라 UI 디자이너, IDE와 통합된 디버거 등 다양한 부가 프로그램을 포함하고 있는 경우가 많다.(예: Apple의 Xcode는 컴파일에 clang/llvm을 사용하지만 훨씬 더 많은 도구들을 제공함)
    * Microsoft Visual Studio (MSVC) - Windows 개발의 표준.
    * Apple Xcode (Clang/LLVM 기반) - macOS/iOS 개발용.
    * Qt Creator, JetBrains CLion 등.
