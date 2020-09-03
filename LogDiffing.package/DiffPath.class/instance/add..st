adding
add: aNode
allIndexes add: aNode index.
allNodes add: aNode.
(mapFirstOccurence includesKey: (aNode index)) ifFalse: [ mapFirstOccurence at: (aNode index) put: self size  ].