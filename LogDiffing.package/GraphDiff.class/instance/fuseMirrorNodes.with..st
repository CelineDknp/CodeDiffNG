processing
fuseMirrorNodes: aNode with:mirrorArray
	|child1 child2 newChild|
	child1 := mirrorArray at:1.
	child2 := mirrorArray at:2.
	newChild := self fuseNode: child1 and: child2. "new node is created"
	aNode links do:[ :each | ((each to = child1) or: (each to = child2)) ifTrue: [ each to: newChild. ]. ]. "Set the links to the new node"
	links do:[ :each | ((each to = child1) or: (each to = child2)) ifTrue: [ each to: newChild. ]. ]. "Set any links previously going to the duplicated nodes to the new one"
	graph add: newChild. "Add new node to graph"
	graph removeAll: mirrorArray.
	labels removeKey: (child2 index).
	^ newChild.