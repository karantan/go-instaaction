package challenge375

import "testing"

func TestRun(t *testing.T) {
	got := Run(998)
	want := "10109"

	if got != want {
		t.Errorf("got '%s' want '%s'", got, want)
	}
}
