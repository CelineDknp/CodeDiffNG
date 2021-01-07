accessing
fuseRound: aNode processed: nodesProcessed
	((self canFuse: aNode) and: ((nodesProcessed includes: aNode)not)) ifTrue: [ "Fuse"
			| toFuse |
			(aNode isFused) ifTrue: [ "We are a fused node"
				toFuse := aNode.
				aNode links do: [ :link |
					(link isNil) ifFalse:[
					(self canFuse: (link to)) ifTrue:[
						toFuse add: (link to) initial: (self getInitialEquivalent: link to).	
						fused := true.
						graph remove: (link to) ifAbsent:[].
					].
					].
				].
			] ifFalse: [ 
					(aNode hasFusedChilds) ifTrue:[ "Linked to a node fused, let's fuse into it"
						toFuse := aNode getFirstFusedChild.
						toFuse add: aNode initial: (self getInitialEquivalent: aNode) . graph remove: aNode.
					]
					ifFalse:[ "The node is not linked to a nodeFused"
						toFuse := NodeFused with: aNode initial: (self getInitialEquivalent: aNode) . graph remove: aNode. graph add: toFuse.
					].
					fused := true.
			].
			(toFuse containsInitial) ifTrue: [ initialNode := toFuse ].
			(toFuse containsTerminal) ifTrue: [ terminalNode := toFuse ].
			nodesProcessed add: toFuse.
			nodesProcessed add: aNode.
			self updateLinks: toFuse.
			toFuse links do: [ :link | link ifNotNil:[(nodesProcessed includes: (link to)) ifFalse: [ self fuseRound: (link to) processed:nodesProcessed.].]. ].
		] ifFalse:[
		nodesProcessed add: aNode.
		aNode links do: [ :link | link ifNotNil:[(nodesProcessed includes: (link to)) ifFalse: [ self fuseRound: (link to) processed:nodesProcessed.].]. ].
	]