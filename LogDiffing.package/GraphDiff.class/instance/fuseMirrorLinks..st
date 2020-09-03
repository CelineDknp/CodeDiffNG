as yet unclassified
fuseMirrorLinks: aNode
	| linkArray newLink oldLinks|
	oldLinks := aNode links.
	linkArray := aNode getMirrorLinks.
	newLink := self fuseLink: (linkArray at:1) and: (linkArray at:2).
	oldLinks removeAll: linkArray.
	oldLinks add: newLink.
	links removeAll: linkArray.
	links add: newLink.
	^ newLink.