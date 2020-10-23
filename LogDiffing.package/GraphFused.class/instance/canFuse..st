testing
canFuse: aNode
	aNode links ifEmpty: [^ true].
	^ ((aNode links noneSatisfy: [ :link | link hasProbabilityChanged ])) and: (links noneSatisfy: [:link | ((link to = aNode) and: (link hasProbabilityChanged))])