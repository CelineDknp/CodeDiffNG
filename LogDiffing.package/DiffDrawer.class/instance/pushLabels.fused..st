drawing
pushLabels: allShapes fused: allFused.
	allShapes pushFront.
	allFused keys do: [ :key | allShapes remove: key ifAbsent: [ ]. ].
	allShapes @ RSLabeled.
	allFused keys do: [ :shape | 
		|label node|
		node := allFused at: shape.
		label := RSLabeled new text: [:notUsed  | node totalNodes. ].
		label shapeBuilder labelShape fontSize: 20; color: Color white; bold.
		label location middle; inner.	
		shape @label.
	].
	allShapes addAll: allFused keys.