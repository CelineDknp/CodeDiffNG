testing
updateLinks: aNodeFused
	|toRemove|
	toRemove := OrderedCollection new.
	links do: [ :link | 
		(link to = self)ifTrue:[toRemove add: link.] ifFalse:[
			(aNodeFused contains: (link from)) ifTrue:[ "Starting point of link is in the fused node"
				(aNodeFused contains: (link to)) ifTrue: [ toRemove add: link. ]. "Link is embedded in node, delete it"
			].
		].
		(aNodeFused contains: (link to)) ifTrue:[ "End point of link is in the fused node"
			(aNodeFused contains: (link from)) ifFalse: [ link to: aNodeFused. ] "If link from outside, point to the fused node. (If true already handeled above)"
		].
	].
	links removeAll: toRemove.