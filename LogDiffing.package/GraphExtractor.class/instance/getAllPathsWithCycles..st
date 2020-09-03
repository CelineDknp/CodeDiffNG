heuristic
getAllPathsWithCycles: cycles
	|paths|
	paths := OrderedCollection new.
	self allCyclePathsHelper: cycles from: initialNode to: terminalNode paths: paths currentPath: (DiffPath with: initialNode).
	^ paths.