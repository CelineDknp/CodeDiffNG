utilities
getAllPathsWithCycles: cycles andHeuristic: heuristic with: minEdits
	|paths|
	paths := OrderedCollection new.
	paths := self getAllCyclePaths: cycles withHeuristic: heuristic andMinEdit: minEdits.
	^ paths.