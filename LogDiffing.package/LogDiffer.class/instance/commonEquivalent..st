as yet unclassified
commonEquivalent: node
	commonNodes do: [ :each | (((each graphFromAt: 1) = node) or: ((each graphFromAt: 2) = node)) ifTrue: [ ^ each ]. ].
	^ nil.