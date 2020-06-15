adding
addNode: str
	| index newNode|
	index := self getNumberFirst: str.
	newNode := Node with: (labels at: index) index: index.
	self graph add: newNode.
	self addLink: str.
