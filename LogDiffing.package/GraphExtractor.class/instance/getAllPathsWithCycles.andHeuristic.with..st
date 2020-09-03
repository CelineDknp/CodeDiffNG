heuristic
getAllPathsWithCycles: cycles andHeuristic: heuristic with: minEdits
	| allPaths basePaths|
	basePaths := self getAllPaths. "Get all paths with no cycles"
	allPaths := basePaths copy.
	self allCyclePathsHeuristicHelper: cycles pruneSize: heuristic andMinEdit: minEdits basePaths: basePaths from: initialNode to: terminalNode paths: allPaths currentPath: (DiffPath with: initialNode) diffEnough: false.
	^ allPaths.