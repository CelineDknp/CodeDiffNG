adding
addLink: aString
	|node restStr otherNode probability link |
	node := self findNode: aString.
	restStr := aString copyFrom: (((node index) asString) size) + 3 to: aString size.
	otherNode := self getNumberFirst: restStr.
	probability := self extractStrBetween: $" from: restStr.
	link := GraphLink with: node and: otherNode with: (probability copyFrom: 4 to: probability size) .
	links add: link.
	node addLink: link.
	
	
	