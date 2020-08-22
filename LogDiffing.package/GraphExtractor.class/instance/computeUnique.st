utilities
computeUnique
	|allLabels result tempRemove|
	result := OrderedCollection new. allLabels := Set new.
	graph do: [ :node |
		(allLabels includes: (node label)) ifTrue:[
				tempRemove := nil.
				result do: [ :each | (node label = each label) ifTrue: [ tempRemove := each. Break. ]].
				tempRemove ifNotNil: [ result remove: tempRemove ].
			] ifFalse: [
				result add: node.
				allLabels add: (node label).
			].
	].
	^ result.