compute
computeAddedNode
	|result missing|
	result := OrderedCollection new.
	(graph2 graph) do: [ :node2 |
		missing := true.
		commonNodes do: [ :common |
			(node2 label = common label) ifTrue: [ missing := false ].
		].
		missing ifTrue: [ result add: node2 ].
	].
	addedNodes := result.
	^ result.