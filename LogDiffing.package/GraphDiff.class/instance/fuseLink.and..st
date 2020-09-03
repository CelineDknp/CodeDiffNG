processing
fuseLink: link1 and: link2
	| newProbability result |
	result := GraphLinkDiff with: link1 from and: link1 to.
	newProbability := link2 status = 'removed'
		ifTrue: [ (link2 label copyFrom: 1 to: 5) , (link1 label copyFrom: 4 to: 6) ]
		ifFalse: [ (link1 label copyFrom: 1 to: 5) , (link2 label copyFrom: 4 to: 6) ].
	result probability: newProbability.
	result label: newProbability.
	result status: 'common'.
	^ result