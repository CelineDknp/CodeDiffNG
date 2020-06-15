accessing
createGraph
	|allText|
	allText := self fileContent contents lines.
	graph := OrderedCollection new.
	labels := Dictionary new.
	allText do: [ :each |
		('*->*' match: each) ifTrue: [ "We are adding a node to the graph "
			(self nodeExists: each) ifTrue:[
					self addLink: each.
				] ifFalse: [ 
					self addNode: each.
				 ].
		 ] ifFalse: [ 
			('*label="*' match: each) ifTrue:[ "We are editing the label dictionary "
				self addLabel: each to: labels. 
			 ]
		].
	].
	graph do: [ :each |
		(each links) do: [ :l |
			l to: (self findNode: (l to asString )).
		]
	].
	^ graph