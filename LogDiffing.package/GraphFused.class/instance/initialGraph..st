accessing
initialGraph: aGraphDiff 
	|other|
	initialGraph := (aGraphDiff cleanCopy).
	other := (aGraphDiff cleanCopy).
	graph := other graph.
	links := other links.
	labels := other labels.
	self initialNode: (other initialNode).