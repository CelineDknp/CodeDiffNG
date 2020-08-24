heuristic
getAllPathsWithCycles: cycles
	|paths|
	paths := OrderedCollection new.
	paths := self getAllCyclePaths: cycles.
	^ paths.