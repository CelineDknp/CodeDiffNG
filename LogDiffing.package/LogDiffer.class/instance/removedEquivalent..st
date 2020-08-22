as yet unclassified
removedEquivalent: node
	graphDiff graph do: [ :each | ((each status = 'removed') and: ((each graphFrom) = node)) ifTrue: [ ^ each ]. ].
	^ nil.