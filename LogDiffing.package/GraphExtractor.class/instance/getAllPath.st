as yet unclassified
getAllPath
	|paths|
	paths := OrderedCollection new.
	(initialNode links) do: [ :each | self getOnePath: (OrderedCollection with: initialNode) with: paths ].
	^ paths.