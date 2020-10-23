adding
fuseWith: aNodeFused
	|linksToRemove|
	nodeContained addAll: aNodeFused nodeContained.
	aNodeFused initialLinks keysDo: [ :key | initialLinks at: key put: (aNodeFused initialLinks at: key) ].
	links addAll: aNodeFused links.
	linksToRemove := links select: [ :link | (((link to) = aNodeFused) or: ((link to) =self)) ].
	links removeAll: linksToRemove.