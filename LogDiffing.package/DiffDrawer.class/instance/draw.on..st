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
	layout on: allShapes.
	allShapes pushFront.
	allShapes removeAll: allFused keys.
	allShapes @ RSLabeled.
	allFused keys do: [ :shape | 
		|label node|
		node := allFused at: shape.
		label := RSLabeled new text: [:notUsed  | node totalNodes. ].
		label shapeBuilder labelShape fontSize: 20; color: Color white; bold.
		label location middle; inner.	
		shape @label.
	].
	self scootOver: graph with: nodeDrawned.
	aCanvas @ RSCanvasController.
	^ aCanvas.