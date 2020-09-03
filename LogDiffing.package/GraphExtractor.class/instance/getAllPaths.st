heuristic
getAllPaths
	|paths|
	paths := OrderedCollection new.
	self allCyclePathsHelper: 0 from: initialNode to: terminalNode paths: paths currentPath: (DiffPath with: initialNode).
	^ paths.