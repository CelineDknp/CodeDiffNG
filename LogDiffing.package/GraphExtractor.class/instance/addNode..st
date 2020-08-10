adding
addNode: aString
	| index newNode|
	index := self getNumberFirst: aString.
	newNode := Node with: (labels at: index) index: index.
	self graph add: newNode.
	self addLink: aString.
