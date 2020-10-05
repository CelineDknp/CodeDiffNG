subclass creation
computeNewProbability: nodeFrom with: nodeTo status: status
	|v1From v1To v2From v2To v1Link v2Link|
	
	(nodeFrom isArray) ifTrue:[ "Get V1/V2 infos from node from"
		v1From := (nodeFrom at: 1).
		v2From := (nodeFrom at: 2).
	] ifFalse: [ 
		(status = 'added') ifTrue: [ v2From := nodeFrom.] ifFalse: [ 	v1From := nodeFrom.].
	].
	(nodeTo isArray) ifTrue:[ "Get V1/V2 infos from node to"
		v1To := (nodeTo at: 1).
		v2To := (nodeTo at: 2).
	] ifFalse: [ 
		(status = 'added') ifTrue: [ v2To:= nodeTo.	] ifFalse: [ v1To:= nodeTo.	].
	].
	v1From ifNotNil: [ "Get V1 link if needed"
		v1From links do:[:each | ((each to) = v1To) ifTrue: [ v1Link := each. ].].
	].
	v2From ifNotNil: [ "Get V2 link if needed"
		v2From links do:[:each | ((each to) = v2To) ifTrue: [ v2Link := each. ].].
	].
	^ Array with:(v1Link ifNotNil: [v1Link probability] ifNil: [0]) with:(v2Link ifNotNil: [v2Link probability] ifNil: [0])
	