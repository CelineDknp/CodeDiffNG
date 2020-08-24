heuristic
getAllCyclePaths: maxCycles
	| allPaths |
	allPaths := OrderedCollection new.
	self allCyclePathsHelper: maxCycles from: initialNode to: terminalNode paths: allPaths currentPath: (DiffPath with: initialNode).
	^ allPaths.