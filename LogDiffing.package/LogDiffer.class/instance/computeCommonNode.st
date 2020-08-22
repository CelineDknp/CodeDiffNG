compute
computeCommonNode
	| result |
	result := OrderedCollection new.
	uniqueNode1
		do: [ :node1 | 
			"First, let's add all the unique nodes with the same label as common nodes"
			uniqueNode2
				do: [ :node2 | 
					(node1 label = node2 label and: (result includes: node1) not)
						ifTrue: [ result add: (node1 create: 'common' withGraph: (Array with: node1 with: node2)).
							Break ] ] ].
	commonPath
		do: [ :paths | 
			(paths at:1) nodeArray
				doWithIndex: [ :each :index  | 
					(self commonInclude:result withArray: (Array with: each with: ((paths at:2)nodeArray at: index)))
						ifFalse: [ result add: (each create: 'common' withGraph: (Array with: each with: ((paths at:2)nodeArray at: index))) ] ] ].	"Let's now complete the list with all the nodes in the common paths (making sure they were not added already)"
	commonNodes := result.
	^ result