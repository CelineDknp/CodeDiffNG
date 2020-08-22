compute
areCommon: path1 and: path2
	|otherNode|
	path1 nodeArray doWithIndex: [ :node :index |
		otherNode := (path2 nodeArray) at: index.
		(node label = otherNode label) ifFalse: [ ^ false. ].
	].
	^ true.