as yet unclassified
createGraphDiff
	commonPath isEmpty ifTrue: [ self computeAll. ]. "If not done already, compute all the necessary variables"
	graphDiff := GraphDiff with: file1 and: file2.
	graphDiff links: OrderedCollection new.
	commonNodes do: [ :each | graphDiff addNode: each]. "First, add all the common nodes"
	graph2 graph do:[ :nodeG2 | "Add nodes from G2, that are added"
		(self isIn:commonNodes node: nodeG2) ifFalse: [ graphDiff addNode: (nodeG2 create: 'added' withGraph: nodeG2) ].
	].
	graph1 graph do:[ :nodeG1 | "Add nodes from G1, that are removed"
		(self isIn:commonNodes node: nodeG1) ifFalse:[ graphDiff addNode: (nodeG1 create: 'removed' withGraph: nodeG1) ].
	].
	graph1 links do: [ :linkG1 | "Look at links from G1"
		|nodeDiffFrom nodeDiffTo|
		nodeDiffFrom := self commonEquivalent: (linkG1 from).
		nodeDiffTo := self commonEquivalent: (linkG1 to).
		((nodeDiffFrom isNotNil) and: (nodeDiffTo isNotNil)) ifTrue: [ (graphDiff links) add: (linkG1 create: 'common' between: nodeDiffFrom and: nodeDiffTo) ].
		nodeDiffTo ifNil: [
			nodeDiffTo := self removedEquivalent: (linkG1 to).
			nodeDiffFrom ifNil: [ nodeDiffFrom := self removedEquivalent: (linkG1 from). ].
			(graphDiff links) add: (linkG1 create: 'removed' between: nodeDiffFrom and: nodeDiffTo).
		].
		nodeDiffFrom ifNil: [
			nodeDiffFrom := self removedEquivalent: (linkG1 from).
			nodeDiffTo ifNil: [ nodeDiffTo := self removedEquivalent: (linkG1 to). ].
			(graphDiff links) add: (linkG1 create: 'removed' between: nodeDiffFrom and: nodeDiffTo).
		]
	].
	graph2 links do: [ :linkG2 | "Look at all links from G2 (excluding the common ones)"
		|nodeDiffFrom nodeDiffTo|
		nodeDiffFrom := self addedEquivalent: (linkG2 from).
		nodeDiffTo := self addedEquivalent: (linkG2 to).
		((nodeDiffFrom isNotNil) and: (nodeDiffTo isNotNil)) ifTrue: [ (graphDiff links) add: (linkG2 create: 'added' between: nodeDiffFrom and: nodeDiffTo) ].
		((nodeDiffTo isNil) and: (nodeDiffFrom isNotNil)) ifTrue: [
			nodeDiffTo := self commonEquivalent: (linkG2 to).
			(graphDiff links) add: (linkG2 create: 'added' between: nodeDiffFrom and: nodeDiffTo).
		].
		((nodeDiffFrom isNil) and: (nodeDiffTo isNotNil)) ifTrue: [
			nodeDiffFrom := self commonEquivalent: (linkG2 from).
			(graphDiff links) add: (linkG2 create: 'added' between: nodeDiffFrom and: nodeDiffTo).
		]
	].