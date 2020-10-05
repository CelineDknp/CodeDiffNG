adding
addLineBetween: aShapeFrom and: aShapeTo withLink: link
	|line label|
	line := RSArrowedLine new from: aShapeFrom; to: aShapeTo.
	link status = 'added' ifTrue:[ line color: (Color green).].
	link status = 'removed' ifTrue:[ line color: (Color red).].
	line attachPoint: RSBorderAttachPoint new.
	canvas add: line.
	label := RSLabeled new text: [:notUsed  | link label ].
	label shapeBuilder labelShape fontSize: 5.
	link status = 'added' ifTrue:[ label shapeBuilder labelShape color: (Color green).].
	link status = 'removed' ifTrue:[ label shapeBuilder labelShape color: (Color red).].
	link status = 'common' ifTrue:[
		link hasProbabilityChanged 
			ifTrue: [ 	label shapeBuilder labelShape color: (Color orange) ]
			ifFalse:[	label shapeBuilder labelShape color: (Color black)]].
	label location inner; middle.
	line @ label.