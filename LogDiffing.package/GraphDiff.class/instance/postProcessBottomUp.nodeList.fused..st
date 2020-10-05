processing
postProcessBottomUp: aNode nodeList: allProcessedNodes fused: fusedBool
	|allNodesLinked allLinksFrom fusedThisRound|
	allNodesLinked := OrderedCollection new.
	links do:[:each | ((each to) = aNode) ifTrue: [allNodesLinked add: (each from)].].
	fusedThisRound := false.
	[aNode hasMirrorChildren: allNodesLinked] whileTrue: [ 
		|newChild mirrorArray|
		fusedThisRound := true.
		mirrorArray := aNode getMirrorChildren: allNodesLinked.
		newChild := self fuseMirrorNodes: aNode with: mirrorArray.
		allNodesLinked removeAll: mirrorArray.
		allNodesLinked add: newChild.
	].
	
	allLinksFrom :=	links select:[:each | (each to) = aNode].
	[aNode hasMirrorLinks: allLinksFrom direction: #from] whileTrue: [ 
		| linkArray newLink nodeToFuse|
		linkArray := aNode getMirrorLinks: allLinksFrom direction: #from.
		nodeToFuse := ((linkArray at:1) from).
		(nodeToFuse hasMirrorLinks) ifTrue: [ 
			fusedThisRound := true.
			newLink := self fuseMirrorLinks: nodeToFuse. 
			allLinksFrom removeAll: linkArray.
			allLinksFrom add: newLink.
		].
	].

	allProcessedNodes add: aNode.
	allLinksFrom do:[:each | (allProcessedNodes includes: (each from)) ifFalse:[ self postProcessBottomUp: (each from) nodeList: allProcessedNodes fused: (fusedBool or: fusedThisRound).].].