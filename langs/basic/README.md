# BASIC

BASIC은 초보자 교육용으로 개발된 언어로, 초창기 PC에는 ROM에 기본으로 들어있는 경우가 많아서
OS가 없이도 구동이 가능했고, 많은 어린이들이 이 언어로 컴퓨터를 배우기 시작했다.
그리고 그 어린이들은 지금은 환갑의 나이에 이르렀다.

```basic
10 PRINT "[BASIC] Hello, World!"
```

## 예제

* `yabasic`
    * [hello.bas](yabasic/hello.bas)
    * [truth.bas](yabasic/truth.bas) - 리즈 시절의 스파게티 코드 방식 Truth Machine 구현
    * [truth-sp.bas](yabasic/truth-sp.bas) - 구조적 프로그래밍 방식 Truth Machine 구현

---
## 소개

* 발표일: 1964-05-01
* 개발자: [John G. Kemeny](https://en.wikipedia.org/wiki/John_G._Kemeny),
    [Thomas E. Kurtz](https://en.wikipedia.org/wiki/Thomas_E._Kurtz)
* 소스 확장자: `.bas`

BASIC은 Beginner's All-purpose Symbolic Instruction Code(초보자를 위한 범용 기호 명령 부호)의 이니셜로
이름에서 부터 교육용이란 것이 명확하게 드러난다.

문법은 특수 기호가 거의 없고 영어 단어를 사용하기 때문에 (영어 화자라면) 정말 쉽게 배울 수 있다.
하지만 반대 급부로 언어의 표현력이 부족하고, 타이핑할 것이 많아지기에 현재는 거의 사용되지 않는다.
(오늘날 초보자 교육용 언어의 지위는 거의 [Python](../python/README.md)에게 넘어간 것으로 보인다.)

기본적으로 인터프리터(Interpreter) 언어로 한줄 입력하면 한줄 실행되는 형태이며, 그렇기에 대화형으로 사용할 수 있다.
이 때문에 초창기 PC의 ROM에 탑재된 경우가 많았으며, 그런 경우 OS를 따로 구매하지 않아도 컴퓨터를 구동시킬 수 있었다.
나중에는 컴파일해서 실행파일을 만들 수 있는 제품도 많이 나왔다.

소스코드 작성시 앞에 숫자(행 번호)를 넣을 수 있는데, `GOTO` 명령어로 해당 번호로 점프할 수 있다. ([truth.bas](yabasic/truth.bas) 참조)
이런 식으로 작성된 코드를 스파게티 코드(Spaghetti code)라고 하며, 70년대 [Pascal](../pascal/README.md)로 대표되는 구조적 프로그래밍(Structured Programming) 패러다임 이전의 구식 코딩 방식이다.

Microsoft의 창업자 빌 게이츠 회장은 젊은 시절 BASIC 인터프리터를 개발해서 판매하면서 사업을 시작했으며,
그래서 BASIC 언어에 많은 애정을 가지고 있었다고 전해진다. 그 때문인지 Microsoft의 OS에서는 BASIC 언어가
언제나 지원되어 왔으며, 최신 Windows OS에서도 VBScript나 Visual Basic .NET 같은 BASIC을 사용할 수 있다.

### 주요 제품(방언)들

* Microsoft
    * Apple II, MSX, Commodore 64 등 초창기 PC의 번들 BASIC은 대부분 Microsoft 에서 개발한 것임
    * DOS: GW-BASIC(MS-DOS 3 까지 번들), QBASIC (MS-DOS 5 이상 번들), QuickBASIC(컴파일러 포함)
    * Visual BASIC: 초기 Windows의 베스트 셀러 개발 도구 (업무용 프로그램 개발용)
    * Visual BASIC .NET: 현재까지 지원중인 버전
* 현대적 BASIC
    * [yabasic](https://www.yabasic.de/) - 오픈소스 BASIC, 구식 코드도 잘 지원함
    * [PureBasic](https://www.purebasic.com/) - 포인터, 구조체 등 고급 기능 지원
    * [FreeBASIC](https://freebasic.net/) - QuickBASIC 호환 모드 제공
    * [Gambas](https://gambaswiki.org/website/) - IDE 환경의 인터프리터, JIT 컴파일러 지원
    * [Xojo](https://www.xojo.com/) - Visual BASIC과 유사한 멀티플랫폼 지원 RAD
