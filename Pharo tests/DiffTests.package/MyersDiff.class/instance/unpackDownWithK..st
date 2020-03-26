utilities
unpackDownWithK: k
	| oldX |
	oldX := (frontier at: k+1) index.
	history := (frontier at: k+1) array.
	x := oldX. y := x - k.