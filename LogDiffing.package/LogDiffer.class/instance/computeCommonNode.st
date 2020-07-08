compute
computeCommonNode
	|result|
	result := OrderedCollection new.
	commonPath do: [:tab | tab do: [ :each | result add: each.]]. "All nodes in common paths are common"
	uniqueNode1 do: [ :node1 |
		uniqueNode2 do: [ :node2 |
			((node1 label = node2 label) and: (result includes: node1) not) ifTrue: [ result add: node1 ].
		].
	].
	commonNodes := result.
	^ result.