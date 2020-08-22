testing
isIn: array node: node

	array do: [ :each | (each label = node label) ifTrue: [ ^ true ]. ].
	^ false.