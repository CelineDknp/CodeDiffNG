adding
add: aNode initial: initialNode
	(aNode isFused) ifTrue:[
		^ self fuseWith: aNode.
	].
	(nodeContained includes: aNode) ifTrue:[^'']. "If node was added previously, do nothing"
	nodeContained add: aNode.
	initialLinks at: aNode put: initialNode links.
	links addAll: aNode links.
	self cleanLinks: aNode.
	