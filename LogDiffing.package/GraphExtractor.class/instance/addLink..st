adding
addLink: str
	|node restStr otherNode probability link |
	node := self findNode: str.
	restStr := str copyFrom: (((node index) asString) size) + 3 to: str size.
	otherNode := self getNumberFirst: restStr.
	probability := self extractStrBetween: $" from: restStr.
	link := GraphLink with: node and: otherNode with: probability.
	node addLink: link.
	
	
	