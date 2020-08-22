accessing
setUp: cycles
	graph1 := GraphExtractor with: file1.
	graph2 := GraphExtractor with: file2.
	graph1 createGraph.
	graph2 createGraph.
	pathsG1 := graph1 getAllPathsWithCycles: cycles.
	pathsG2 := graph2 getAllPathsWithCycles: cycles.
	commonPath := OrderedCollection new.
	uniqueNode1 := graph1 computeUnique.
	uniqueNode2 := graph2 computeUnique.