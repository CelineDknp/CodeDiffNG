drawing
createShapeWith: aNode fused: allFused canvas: aCanvas
	|result|
	result :=	RSEllipse new.
				result draggable.
				result model: aNode label.
	((aNode status = 'fused') & (aNode totalNodes > 1)) ifTrue:[
				|inspectable connection|
				allFused at: result put: aNode.
				result color: Color gray;
				size: (40 + (aNode totalNodes*4)).
				connection := RSPopupConnection new.
				connection inputCanvas: aCanvas.
				connection output: [ :inputModel |
					| builder |
					builder := RSCanvas new.
					self draw: aNode mainGraph on: builder. 
					builder @ RSCanvasController.
					builder open.
				].
				"inspectable := RSInspectable new.
				inspectable inspectShapeBlock: [ :input | 
					| builder |
					builder := RSCanvas new.
					self draw: aNode mainGraph on: builder. 
					builder @ RSCanvasController.
					builder open.
				].
				result @ inspectable."
			] ifFalse:[
				|border|
				border := RSBorder new.
				border width:2.
				result model: aNode label;
					border: border;
					color: Color white;
					size: 40.
			].
		^ result.