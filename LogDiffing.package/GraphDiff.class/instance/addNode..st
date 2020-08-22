adding
addNode: aNode
	graph add: aNode.
	aNode index: nextIndex.
	labels at: nextIndex put: (aNode label).
	nextIndex := nextIndex + 1.
	aNode terminal ifTrue: [ terminalNode := aNode. ].
	aNode initial ifTrue: [ initialNode := aNode. ].