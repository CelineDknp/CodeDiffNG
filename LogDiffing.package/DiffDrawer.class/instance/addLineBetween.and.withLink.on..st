adding
addLineBetween: aShapeFrom and: aShapeTo withLink: link on:aCanvas
	|line interaction arrow|
	arrow := RSPolygon new 
        points: { -10@0. 0@ -10. 10@0 };
        size: 15+(link probabilityDelta *15).
	line := RSArrowedLine new from: aShapeFrom; to: aShapeTo.
	line markerEnd: arrow.
	line markerEnd offset: 6+(link probabilityDelta *5).
	link hasProbabilityChanged ifTrue:[
		line width: 2+ (link probabilityDelta *4).
		link status = 'common' ifTrue:[ line color: (Color orange). arrow color: Color orange.].
		link status = 'added' ifTrue:[ line color: (Color green). arrow color: Color green.].
		link status = 'removed' ifTrue:[ line color: (Color red). arrow color: Color red.].
	] ifFalse:[ line width: 1. ].
	line attachPoint: RSBorderAttachPoint new.
	line model: link label.
	line @RSPopup.
	
	interaction := RSHighlightable new.
	interaction highlightColor: Color black.
	aCanvas edges @ interaction.
	aCanvas add: line.