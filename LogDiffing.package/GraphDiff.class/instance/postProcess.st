processing
postProcess
	|fused |
	fused := true.
	[ fused ] whileTrue:[
		fused := false.
		self postProcessTopDown: initialNode nodeList: (OrderedCollection new) fused: fused.
		self postProcessBottomUp: terminalNode nodeList: (OrderedCollection new) fused: fused.
		
	].
	