drawing
createOrGetNode: node with: dict on: aCanvas withFused: fusedDict
	|result|
	((dict keys) includes: node) ifTrue:[
			result := dict at: node.
			] ifFalse:[
			result := self createShapeWith: node fused: fusedDict canvas: aCanvas.
			node status = 'added' ifTrue:[ result color: (Color green).].
			node status = 'removed' ifTrue:[ result color: (Color red).].
			aCanvas add: result.
			result @ RSDraggable.
			result @ RSPopup.
			dict at: node put: result.
		].
	^ result.