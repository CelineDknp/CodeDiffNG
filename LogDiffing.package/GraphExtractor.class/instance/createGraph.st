accessing
createGraph
	|allText tempIndex|
	allText := self fileContent contents.
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
				tempIndex := self addLabel: each to: labels. 
				(labels at: tempIndex) = 'TERMINAL' ifTrue: [ "Add terminal node first to allow links"
					terminalNode := Node with: 'TERMINAL' index: tempIndex. 
					self graph add: terminalNode.  ]. 
			 ]
		].
	].
	graph do: [ :each |
		(each label) = 'INITIAL' ifTrue:[ initialNode := each].
		(each links) do: [ :l |
			l to: (self findNode: (l to asString )).
		]
	].
	^ self