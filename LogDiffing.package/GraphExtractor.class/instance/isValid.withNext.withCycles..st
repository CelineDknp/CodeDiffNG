testing
isValid: currentPath withNext: nextNode withCycles: maxCycles
	(currentPath isLastNode: nextNode) ifTrue: [ ^ false ].
	maxCycles = 0 	ifTrue:[ ^ (currentPath includes:nextNode) not ]
						ifFalse:[
							(currentPath includes: nextNode) ifTrue: [^((currentPath size - (currentPath firstOccurence: nextNode)) <= maxCycles) ]
																			ifFalse: [^ true].
	].