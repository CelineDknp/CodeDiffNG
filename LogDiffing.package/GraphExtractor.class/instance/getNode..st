accessing
getNode: anIndex
	graph do: [ :each | ((each index) = anIndex) ifTrue: [ ^ each ]. ].