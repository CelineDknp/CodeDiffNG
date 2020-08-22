as yet unclassified
commonInclude: allValues withArray: anArray
	allValues do: [ :eachCommonNode | (((eachCommonNode graphFromAt: 1) = (anArray at: 1)) and: ((eachCommonNode graphFromAt: 2) = (anArray at: 2))) ifTrue: [ ^ true. ]. ].
	^ false.