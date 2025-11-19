# AWK

Awk는 Unix 및 호환 OS에서 텍스트 처리를 위해서 사용하는 프로그램으로,
주로 스크립트(Shell Script) 작성시에 고급 텍스트 처리를 위해서 호출하는 형태로 많이 사용한다.

```awk
#!/usr/bin/awk -f

BEGIN {
    print "[AWK] Hello, World!"
    exit
}
```

## 예제

주로 쉘 스크립트에서 인라인 호출로 많이 사용된다.

```shell
echo My name is $(awk -F: -v user=$USER '$1 == user { split($5, name, ","); print name[1] }' /etc/passwd)
```

* [hello.awk](langs/awk/hello.awk)
* [truth.awk](langs/awk/truth.awk)

---
## 소개

Awk라는 이름은 개발자인 엘드리프 에이호(Alfred Aho), 피터 와인버거(Peter Weinberger), 브라이언 커니핸(Brian Kernighan)의 이름의 이니셜을 딴 것이다.

프로그램의 기본 구조(`패턴매칭 { 처리할 로직 }`)가 입력 파일을 한 줄씩 순차적인 처리/변환하는 데에 최적화되어 있다. 이 때문에 프로그래밍 언어라고 할 수 있는 기능을 대부분 갖추고 있지만, 스트림 편집기 `sed`와 영역이 많이 겹친다.
