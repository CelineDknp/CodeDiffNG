compute
computeRemovedNode
	|result missing|
	result := OrderedCollection new.
	(graph1 graph) do: [ :node1 |
		missing := true.
		commonNodes do: [ :common |
			(node1 label = common label) ifTrue: [ missing := false ].
		].
		missing ifTrue: [ result add: node1 ].
	].
	removedNodes := result.
	^ result.