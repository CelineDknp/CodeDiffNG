utility
getOnePath: currentPath with: allPaths
	|currentNode copyPath|
	currentNode := currentPath last.
	currentNode terminal ifTrue: [ ^ ''].
	currentNode links do: [ :link |
		(link to) terminal ifTrue: [ "We are at a terminal node, let's finish the path and add it"
			currentPath add: link to.
			allPaths add: currentPath.
		] ifFalse: [ 
			(currentPath last) terminal ifTrue: [ ^ ''].
			(self noLoop: currentPath next: link to) ifTrue: [ 
				copyPath := currentPath copy.
				copyPath add: link to.
				self getOnePath: copyPath with: allPaths. 
			].
		].
	]