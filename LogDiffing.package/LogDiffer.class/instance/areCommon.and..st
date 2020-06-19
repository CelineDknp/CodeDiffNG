as yet unclassified
areCommon: path1 and: path2
	|otherNode|
	path1 doWithIndex: [ :node :index |
		otherNode := path2 at: index.
		(node label = otherNode label) ifFalse: [ ^ false. ].
	].
	^ true.