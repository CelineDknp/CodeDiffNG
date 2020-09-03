accessing
firstOccurence: aNode
	(mapFirstOccurence includesKey: (aNode index)) ifTrue: [ ^ mapFirstOccurence at: (aNode index) ] ifFalse: [ ^ -1 ]. 