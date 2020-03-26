utilities
unpackRightWithK: k
	| oldX |
	oldX := (frontier at: k-1) index.
	history := (frontier at: k-1) array.
	x := oldX + 1. y := x - k.	