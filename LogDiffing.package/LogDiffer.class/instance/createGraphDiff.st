compute
createGraphDiff
	|equivalentG1 equivalentG2|
	equivalentG1 := Dictionary new.
	equivalentG2 := Dictionary new.
	commonPath isEmpty ifTrue: [ self computeAll. ]. "If not done already, compute all the necessary variables"
	graphDiff := GraphDiff with: file1 and: file2.
	graphDiff links: OrderedCollection new.
	commonNodes do: [ :each | graphDiff addNode: each]. "First, add all the common nodes"
	graph2 graph do:[ :nodeG2 | "Add nodes from G2, that are added"
		|tempCommon|
		tempCommon := self commonEquivalent: nodeG2.
		(tempCommon) ifNil:[ |tempNode| tempNode := (nodeG2 create: 'added' withGraph: nodeG2). graphDiff addNode: tempNode. equivalentG2 at: nodeG2 put: tempNode.]
		ifNotNil: [ equivalentG2 at: nodeG2 put: tempCommon. ].
	].
	graph1 graph do:[ :nodeG1 | "Add nodes from G1, that are removed"
		|tempCommon|
		tempCommon := self commonEquivalent: nodeG1.
		(tempCommon) ifNil:[ |tempNode| tempNode := (nodeG1 create: 'removed' withGraph: nodeG1). graphDiff addNode: tempNode. equivalentG1 at: nodeG1 put: tempNode. ]
		ifNotNil: [ equivalentG1 at: nodeG1 put: tempCommon. ].
	].
	
	graph1 links do: [ :linkG1 | "Add all liks from G1 as if they are removed"
		|nodeDiffFrom nodeDiffTo|
		nodeDiffFrom := equivalentG1 at: (linkG1 from).
		nodeDiffTo := equivalentG1 at: (linkG1 to).
		(graphDiff links) add: (linkG1 create: 'removed' between: nodeDiffFrom and: nodeDiffTo)
	].
	graph2 links do: [ :linkG2 | "Add all liks from G1 as if they are removed"
		|nodeDiffFrom nodeDiffTo linkBetween|
		nodeDiffFrom := equivalentG2 at: (linkG2 from).
		nodeDiffTo := equivalentG2 at: (linkG2 to).
		linkBetween := self findLinkBetween: nodeDiffFrom and: nodeDiffTo. "If link exists, select it"
		linkBetween ifNil: [ 
			(graphDiff links) add: (linkG2 create: 'added' between: nodeDiffFrom and: nodeDiffTo)
		] ifNotNil:[
			linkBetween status: 'common'.
		]
	]
	