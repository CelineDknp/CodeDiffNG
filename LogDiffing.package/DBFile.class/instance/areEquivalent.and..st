extraction
areEquivalent: anArray and: anotherArray
	anArray size = anotherArray size ifFalse: [ ^ false ].
	1 to: (anArray size) do: [ :index |
		(((anArray at: index) label) = ((anotherArray at: index) label)) ifFalse: [ ^ false ].
	].
	^ true.