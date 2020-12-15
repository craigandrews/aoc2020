package main

import "fmt"

func main() {

	numbers := [30000000]int{}
	var last, c, n int
	for c, n = range []int{16, 1, 0, 18, 12, 14, 19} {
		c++
		numbers[n] = c
		last = n
	}

	fmt.Println(last, c, n)

	for ; c < 30000000; c++ {
		p := numbers[last]
		numbers[last] = c
		if p == 0 {
			last = 0
		} else {
			last = c - p
		}
	}

	fmt.Println(last)
}
