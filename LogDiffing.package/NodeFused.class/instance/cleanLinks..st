adding
cleanLinks: aNode
	|linksToRemove|
	linksToRemove := links select: [ :link | (((link to) = aNode) or: (link to)=self) ].
	links removeAll: linksToRemove.
	links do: [ :link | link from: self ].