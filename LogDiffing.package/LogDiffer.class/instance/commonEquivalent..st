compute
commonEquivalent: node
	|result|
	result := commonNodes select: [ :each | ((each graphFromAt: 1) = node) or: ((each graphFromAt: 2) = node)].
	result isNotEmpty ifTrue: [^(result first)] ifFalse: [^nil].