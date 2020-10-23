adding
mainGraph
	|result idMap|
	result := GraphDiff new.
	result setUpVariables.
	idMap := Dictionary new.
	nodeContained do: [ :node | "create all the new nodes and the maps"
		|newNode idNew| 
		newNode := NodeDiff with: node label.
		idNew := result addNode: newNode.
		idMap at: node index put: idNew.
	].
	nodeContained do: [ :node | "create all the edges using old nodes and map"
		|newEquivalent|
		newEquivalent := result getNode: (idMap at: (node index)).
		(initialLinks at: node) do: [ :link | |toEquivalent newLink|
			(idMap keys includes: (link to index)) ifTrue:[
				toEquivalent := result getNode: (idMap at: (link to index)).
				newLink := (GraphLinkDiff with: newEquivalent and: toEquivalent withBefore: (link probabilityBefore ) withAfter: (link probabilityAfter)).
				newEquivalent links add: newLink.
				result links add: newLink.
			].
		].
	].
	^result.