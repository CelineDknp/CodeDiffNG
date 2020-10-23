fusing
fuse
	fused := true.
	[fused] whileTrue:[
		fused := false.
		self fuseRound: initialNode processed: (OrderedCollection new).
	]