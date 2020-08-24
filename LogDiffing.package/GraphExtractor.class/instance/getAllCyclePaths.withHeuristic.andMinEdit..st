heuristic
getAllCyclePaths: maxCycles withHeuristic: startingSize andMinEdit: editSize
	| allPaths basePaths|
	basePaths := OrderedCollection new.
	self allCyclePathsHelper: 0 from: initialNode to: terminalNode paths: basePaths currentPath: (DiffPath with: initialNode). "Get all paths with no cycles"
	allPaths := basePaths copy.
	self allCyclePathsHeuristicHelper: maxCycles pruneSize: startingSize andMinEdit: editSize basePaths: basePaths from: initialNode to: terminalNode paths: allPaths currentPath: (DiffPath with: initialNode) diffEnough: false.
	^ allPaths.