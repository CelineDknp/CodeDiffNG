accessing
setUp 
	graph1 := GraphExtractor with: file1.
	graph2 := GraphExtractor with: file2.
	graph1 createGraph.
	graph2 createGraph.
	pathsG1 := graph1 getAllPaths.
	pathsG2 := graph2 getAllPaths.
	commonPath := OrderedCollection new.
	uniqueNode1 := graph1 computeUnique.
	uniqueNode2 := graph2 computeUnique.