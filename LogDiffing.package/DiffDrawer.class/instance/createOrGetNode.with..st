drawing
createOrGetNode: node with: dict
	|result|
	((dict keys) includes: node) ifTrue:[
			result := dict at: node.
			] ifFalse:[
			result := nodeModel value: (node label).
			node status = 'added' ifTrue:[ result color: (Color green).].
			node status = 'removed' ifTrue:[ result color: (Color red).].
			canvas add: result.
			result @ RSDraggable.
			dict at: node put: result.
		].
	^ result.