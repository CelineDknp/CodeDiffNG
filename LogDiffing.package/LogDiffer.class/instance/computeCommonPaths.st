as yet unclassified
computeCommonPaths
	|tempPaths1 tempPaths2|
	tempPaths1 := pathsG1 copy.
	tempPaths2 := pathsG2 copy.
	tempPaths1 do: [ :p1 |
		tempPaths2 do: [ :p2 |
			(self areCommon: p1 and: p2) ifTrue: [ 
				commonPath add: p1.
				Break.
			 ].
		].
	
	 ]
	