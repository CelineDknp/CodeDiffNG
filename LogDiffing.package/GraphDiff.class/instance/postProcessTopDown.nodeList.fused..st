processing
postProcessTopDown: aNode nodeList: allProcessedNodes fused: fusedBool
	|fusedThisRound|
	fusedThisRound := false.
	[aNode hasMirrorChildren] whileTrue: [
		fusedThisRound := true.
		self fuseMirrorNodes: aNode.
		
	].
	[aNode hasMirrorLinks] whileTrue: [ 
		fusedThisRound := true.
		self fuseMirrorLinks: aNode.
	].
	allProcessedNodes add: aNode.
	aNode links do:[:each | (allProcessedNodes includes: (each to)) ifFalse:[ self postProcessTopDown: (each to) nodeList: allProcessedNodes fused: (fusedBool or: fusedThisRound).].].