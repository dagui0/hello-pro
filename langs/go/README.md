# Go

Go 언어는 이름이 너무 일반적인 단어라서 golang이라고 쓰는 경우가 많다. 
Go Language (GoLang)는 Google에서 2009년에 발표한 정적 타입, 컴파일 언어로, 빠른 컴파일 속도, 단순한 문법, 그리고 고루틴과 채널을 이용한 강력한 동시성 지원이 핵심 특징입니다. 현대 클라우드 인프라(Docker, Kubernetes)와 고성능 웹 서비스 백엔드 구축에 광범위하게 사용되고 있습니다.

```go
package main

import "fmt"

func main() {
	fmt.Println("Hello, World!")
}
```

---
## 설치 및 실행

### 직접 설치

자세한 사항은 https://go.dev/doc/install 참조.

* Debian: `sudo apt install golang delve`
* RedHat: `sudo dnf install go-toolset`
* macOS (MacPorts): `sudo port install go delve`
* Windows (Chocolatey): `choco install golang`

### Docker 사용

`local.mk` 파일을 만들고 아래과 같이 지정한다.

```makefile
GO = docker run --rm -u $$UID:$$GID -v .:/work -w /work golang:latest go
```

### 예제

* [`make hello`](hello.go) - Hello world example.
* [`make truth`](truth.go) - Truth machine example.

---
## 소개

* 발표일: 2009-11-10
* 개발자: [Robert Griesemer](https://en.wikipedia.org/wiki/Robert_Griesemer),
    [Rob Pike](https://en.wikipedia.org/wiki/Rob_Pike),
    [Ken Thompson](https://en.wikipedia.org/wiki/Ken_Thompson)
* 지원 OS: BSD, Linux, macOS, Solaris, Windows
* 라이센스: [3-clause BSD](https://en.wikipedia.org/wiki/BSD_licenses#3-clause) + patent grant
* 소스 확장자: `.go`

### 개발 목적 및 철학

* 컴파일 속도: Go는 현대의 대규모 소프트웨어 개발 환경에서 컴파일 시간이 너무 오래 걸리는 문제를 해결하기 위해 탄생했습니다. 수백만 줄의 코드를 몇 초 만에 컴파일하는 것을 목표로 합니다.
* 단순성 (Simplicity): C++과 같은 언어들의 복잡성을 피하고, 단순하고 읽기 쉬운 문법을 채택했습니다. 이는 코드 가독성과 유지 보수성을 크게 향상시킵니다.
    * 제외된 기능: 클래스 상속, 제네릭 (초기 버전), 어노테이션(Annotation), 예외 처리(Exception Handling) 등 복잡한 OOP(객체 지향 프로그래밍) 기능을 의도적으로 배제했습니다. (참고: 제네릭은 2022년 Go 1.18에서 추가되었지만, 여전히 단순함을 지향합니다.)

### 동시성 (Concurrency) 및 병렬성 (Parallelism)

Go의 가장 강력한 특징이며, 현대 분산 시스템에 필수적인 요소입니다.
* 고루틴 (Goroutines): 운영체제 스레드보다 훨씬 가벼운 경량 스레드입니다. 수십만 개의 고루틴을 동시에 실행할 수 있어 고성능 네트워크 서비스 구축에 적합합니다.
* 채널 (Channels): 고루틴 간의 통신 및 동기화를 위한 메시지 전달 메커니즘입니다. "메모리를 공유하여 통신하지 말고, 통신하여 메모리를 공유하라"는 Go의 동시성 철학을 구현합니다.

> "Do not communicate by sharing memory; instead, share memory by communicating." 

### 언어 설계의 특징

* 가비지 컬렉션 (Garbage Collection, GC): 수동적인 메모리 관리(C/C++의 `malloc`/`free`)의 복잡성과 오류 가능성을 없애기 위해 자동 메모리 관리(GC) 기능을 내장하고 있습니다.
* 정적 타입 (Statically Typed): 컴파일 시점에 타입 오류를 잡아내어 런타임 오류를 줄입니다.
* 도구 (Tooling): 언어 자체에 강력한 빌드, 테스트, 포맷팅 도구(`go build`, `go test`, `go fmt`)가 통합되어 있어 개발 환경 구성이 매우 간편합니다.
* 모듈 (Modules): 프로젝트의 종속성(dependencies)을 관리하는 공식적인 방법이며, 소스코드의 버전 관리 및 재현 가능한 빌드를 가능하게 합니다. (현재 당신의 프로젝트에서 사용 중인 `go.mod` 파일이 이 역할을 합니다.)

### 활용 영역

* 웹 서비스 및 클라우드 인프라
    * 네트워크 프로그래밍: 고루틴/채널 덕분에 웹 서버, API 서버, 마이크로서비스 등 높은 동시 처리량이 필요한 백엔드 시스템 구축에 널리 사용되었습니다.
    * 클라우드 컴퓨팅: Docker, Kubernetes와 같은 현대 클라우드 인프라의 핵심 도구들이 Go로 개발되었습니다. Go는 이식성과 작은 바이너리 크기 덕분에 컨테이너 환경에 매우 적합합니다.
* 멀티 플랫폼 CLI 도구
    * 크로스 컴파일: Go는 단일 명령으로 다양한 OS(Linux, Windows, macOS 등)에서 실행 가능한 바이너리를 만들 수 있어 CLI 도구 개발에 이상적입니다.

---
## 사용 방법

`go` 명령어는 Go 언어의 빌드, 테스트, 포맷, 종속성 관리 등을 통합적으로 처리하는 도구입니다.

### 컴파일 및 실행

* `go run 소스파일.go`: 컴파일 후 즉시 실행
* `go build [ -o 실행파일명 ] 소스파일.go`: 실행파일 생성
* `go install`: 컴파일후 실행파일을 `$GOPATH/bin` 또는 `$GOBIN`에 설치

### 모듈 및 종속성 관리 (Go Modules)

Go 1.11 이후의 표준 패키지 관리 시스템입니다. `go.mod` 파일은 모듈의 이름과 요구되는 Go 버전을 정의하며, `go.sum`은 종속성 패키지의 무결성을 검증합니다.

* `go mod init`: 현재 디렉토리에 모듈 정의 파일 `go.mod`을 생성하고 모듈 경로를 지정합니다.
* `go get`: 외부 패키지(라이브러리)를 다운로드하고 `go.mod` 파일에 종속성을 추가하거나 업데이트합니다.
* `go mod tidy`: 실제로 코드에서 사용되는 종속성만 `go.mod` 파일에 남기고, 사용되지 않는 종속성은 제거하여 정리합니다.

### 기타

* `go fmt`: Go의 표준 스타일(`gofmt`)에 맞게 소스 코드를 자동으로 포맷합니다. Go는 코딩 스타일 논쟁을 피하기 위해 공식 포맷터를 제공합니다.
* `go vet`: 코드를 정적으로 분석하여 잠재적인 버그나 의심스러운 구조를 찾아냅니다. (예: 포맷 문자열 오류 등)
* `go test`: 파일 이름이 `*_test.go`로 끝나는 파일 내의 테스트 함수(`func Test...`)들을 찾아 실행합니다.
* `go doc`: Go 표준 라이브러리나 로컬 패키지의 문서를 콘솔에서 바로 조회합니다.
* `go env`: 현재 Go 환경에 설정된 모든 환경 변수를 출력합니다. (`$GOPATH`, `$GOROOT`, `$GOOS`, `$GOARCH` 등)
* `go version`: 현재 설치된 Go 컴파일러의 버전을 출력합니다.
