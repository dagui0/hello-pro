package main

import (
	"fmt"
	"strconv"
)

type TruthMachine struct{}

func main() {

	intro := `
Go implementation of the Truth Machine

The Truth Machine is a simple program for learning
a programing language that takes only two inputs.

* 1: Infinitely outputs "1". You can exit using <Ctrl-C>.
* 0: Outputs "0" and terminates.
`
	fmt.Println(intro)

	tm := TruthMachine{}

	for true {
		var input string
		fmt.Print("Enter 1 or 0: ")
		_, err := fmt.Scanf("%s", &input)
		if err != nil {
			continue
		}

		var intputInt int
		intputInt, err = strconv.Atoi(input)
		if err != nil {
			continue
		}

		err = tm.Run(intputInt)
		if err == nil {
			break
		} else {
			continue
		}
	}
}

func (this TruthMachine) Run(value int) error {
	if value == 1 {
		this.ExecTrueAction()
		return nil
	} else if value == 0 {
		this.ExecFalseAction()
		return nil
	} else {
		return fmt.Errorf("invalid input: %d. Only 0 or 1 allowed", value)
	}
}

func (this TruthMachine) ExecTrueAction() {
	for true {
		fmt.Println("1")
	}
}
func (this TruthMachine) ExecFalseAction() {
	fmt.Println("0")
}
