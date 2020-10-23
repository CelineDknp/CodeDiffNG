as yet unclassified
getFirstFusedChild
	links do: [ :link | ((link to) isFused) ifTrue:[ ^ (link to)]. ].
	^ nil.