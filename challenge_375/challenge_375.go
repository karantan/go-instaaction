package challenge375

import (
	"bytes"
	"strconv"
)

//
// Description
// A number is input in computer then a new no should get printed by adding one to each
// of its digit. If you encounter a 9, insert a 10 (don't carry over, just shift things
// around).
//
// For example, 998 becomes 10109.
//
// Bonus
// This challenge is trivial to do if you map it to a string to iterate over the input,
// operate, and then cast it back. Instead, try doing it without casting it as a string
// at any point, keep it numeric (int, float if you need it) only.
//
// Ref: https://www.reddit.com/r/dailyprogrammer/comments/aphavc/20190211_challenge_375_easy_print_a_new_number_by/

// Run function execute the main logic for the challenge 375
func Run(number int) (stringNumber string) {
	var solution bytes.Buffer
	stringNumber = strconv.Itoa(number)
	for _, digit := range stringNumber {
		solution.WriteString(addOne(string(digit)))
	}
	return solution.String()
}

func addOne(number string) (stringNumber string) {
	intNumber, _ := strconv.Atoi(number)
	stringNumber = strconv.Itoa(intNumber + 1)
	return stringNumber
}
