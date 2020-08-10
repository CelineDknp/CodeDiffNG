utilities
computeUnique
	|allLabels result|
	result := OrderedCollection new. allLabels := Set new.
	graph do: [ :node |
		(allLabels includes: (node label)) ifTrue:[
				result do: [ :each | (node label = each label) ifTrue: [ result remove: each]. ]
			] ifFalse: [
				result add: node.
				allLabels add: (node label).
			].
	].
	^ result.