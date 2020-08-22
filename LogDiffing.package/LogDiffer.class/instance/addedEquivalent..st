as yet unclassified
addedEquivalent: node
	graphDiff graph do: [ :each | ((each status = 'added') and: ((each graphFrom) = node)) ifTrue: [ ^ each ]. ].
	^ nil.