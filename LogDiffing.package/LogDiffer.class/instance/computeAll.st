as yet unclassified
computeAll 
	self computeCommonPaths. "We need to start with the common paths to compute the common nodes using them"
	self computeCommonNode.
	self computeAddedNode.
	self computeRemovedNode.