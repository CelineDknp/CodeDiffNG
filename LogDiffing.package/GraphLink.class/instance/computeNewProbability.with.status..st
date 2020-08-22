as yet unclassified
computeNewProbability: nodeFrom with: nodeTo status: status
	|v1From v1To v2From v2To v1Link v2Link|
	(status = 'common') ifTrue: [ 
		v1From := (nodeFrom at: 1).
		v2From := (nodeFrom at: 2).
		v1To := (nodeTo at: 1).
		v2To := (nodeTo at: 2).
		(nodeFrom at: 1) links do:[:each | (((each to) = v1To) and: (each from) = v1From) ifTrue: [ v1Link := each. Break.].].
		(nodeFrom at: 2) links do:[:each | (((each to) = v2To) and: (each from) = v2From) ifTrue: [ v2Link := each. Break.].].
		^ ((v1Link probability) asString, '->', (v2Link probability) asString).
		].
	(status = 'added') ifTrue: [ 
		(nodeFrom isArray) ifTrue: [ (nodeFrom at:2) links do:[:each | (((each to) = nodeTo ) and: (each from) = (nodeFrom at:2)) ifTrue: [ v1Link := each. Break.].]. ]
		ifFalse:[
			(nodeTo isArray) ifTrue: [ nodeFrom links do:[:each | (((each to) = (nodeTo at:2) ) and: (each from) = nodeFrom) ifTrue: [ v1Link := each. Break.].]. ] 
			ifFalse: [ nodeFrom links do:[:each | (((each to) = nodeTo ) and: (each from) = nodeFrom) ifTrue: [ v1Link := each. Break.].]. ]].
		^ ('0->', (v1Link probability) asString).
		].
	(status = 'removed') ifTrue: [
		(nodeFrom isArray) ifTrue: [ (nodeFrom at:1) links do:[:each | (((each to) = nodeTo ) and: (each from) = (nodeFrom at:1)) ifTrue: [ v1Link := each. Break.].]. ]
		ifFalse:[
			(nodeTo isArray) ifTrue: [ nodeFrom links do:[:each | (((each to) = (nodeTo at:1) ) and: (each from) = nodeFrom) ifTrue: [ v1Link := each. Break.].]. ] 
			ifFalse: [ nodeFrom links do:[:each | (((each to) = nodeTo ) and: (each from) = nodeFrom) ifTrue: [ v1Link := each. Break.].]. ]].
		^ ((v1Link probability) asString,'->0').
		].
	
	^ 0