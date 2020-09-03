printing
labelLine: aKey and: aLabel
	| result |
	result := '  ' , (aKey asString) , ' [label="' , aLabel , '"'.
	aLabel = 'TERMINAL'
		ifTrue: [ ^result , ',shape=diamond];' ].
	result := aLabel = 'INITIAL'
		ifTrue: [ result , ',shape=box];' ]
		ifFalse: [ result , '];' ].
	^ result