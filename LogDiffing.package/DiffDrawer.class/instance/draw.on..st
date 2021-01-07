drawing-general
draw: aGraph on: aCanvas
	|allShapes graph nodeDrawned allFused|
	nodeDrawned := Dictionary new.
	graph := aGraph mainGraph.
	allFused := Dictionary new.
	allShapes := graph collect:[ :node |
		|currentNodeShape|
		currentNodeShape := self createOrGetNode: node with: nodeDrawned on: aCanvas withFused: allFused.
		node links do: [ :link|
			|nodeToShape|
			nodeToShape := self createOrGetNode: (link to) with: nodeDrawned on: aCanvas withFused: allFused.
			self addLineBetween: currentNodeShape and: nodeToShape withLink: link on: aCanvas. 
		].
		currentNodeShape.
	] as: RSGroup.
	self pushLabels: allShapes fused: allFused.
	self addLayoutSelector: aCanvas onShapes: allShapes withGraph: graph withDict: nodeDrawned.
	aCanvas @ RSCanvasController.
	^ aCanvas.