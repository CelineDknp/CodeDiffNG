compute
commonInclude: allValues withArray: anArray
	^ allValues anySatisfy: [ :eachCommonNode | ((eachCommonNode graphFromAt: 1) = (anArray at: 1)) and: ((eachCommonNode graphFromAt: 2) = (anArray at: 2)) ].