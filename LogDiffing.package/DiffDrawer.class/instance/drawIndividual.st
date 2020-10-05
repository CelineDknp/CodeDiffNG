drawing
drawIndividual
	|allShapes graph nodeDrawned|
	nodeDrawned := Dictionary new.
	allShapes := OrderedCollection new.
	graph := differ graphDiffGraph.
	allShapes := graph collect:[ :node |
		|currentNodeShape|
		currentNodeShape := self createOrGetNode: node with: nodeDrawned.
		node links do: [ :link|
			|nodeToShape|
			nodeToShape := self createOrGetNode: (link to) with: nodeDrawned.
			self addLineBetween: currentNodeShape and: nodeToShape withLink: link. 
		].
		currentNodeShape.
	] as: RSGroup.
	allShapes @ RSPopup.
	
	layout on: allShapes.
	canvas @ RSCanvasController.
	^ canvas.