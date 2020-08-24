heuristic
allCyclePathsHelper: maxCycles from: nodeFrom to: nodeTo paths: allPaths currentPath: currentPath
	| nextPath nextNode|
	nodeFrom = nodeTo ifTrue: [ allPaths add: currentPath. ] "We are done with this path"
	ifFalse: [ 
		nodeFrom links do: [ :each |
			nextNode := each to.
			(self isValid: currentPath withNext: nextNode withCycles: maxCycles) ifTrue: [ 
				nextPath := currentPath copy.
				nextPath add: nextNode.
				self allCyclePathsHelper: maxCycles  from: nextNode to: nodeTo paths: allPaths  currentPath: nextPath. 
			].
		].
	].