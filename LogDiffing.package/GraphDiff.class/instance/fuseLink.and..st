processing
fuseLink: link1 and: link2
	| result |
	result := GraphLinkDiff with: link1 from and: link1 to.
	link2 status = 'removed'
		ifTrue: [ result probabilityBefore: (link2 probabilityBefore). result probabilityAfter: (link1 probabilityAfter).]
		ifFalse: [ result probabilityBefore: (link1 probabilityBefore). result probabilityAfter: (link2 probabilityAfter). ].
	result status: 'common'.
	^ result