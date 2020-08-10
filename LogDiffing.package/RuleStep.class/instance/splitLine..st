initialization
splitLine: aLog
	| labelPart patchesPart successPart foundPatches donePatches|
	foundPatches := false.
	donePatches := false.
	labelPart := ''. patchesPart  := ''.
	successPart := aLog last. "The success/failure is always 1/0"
	(aLog copyFrom: 1 to: ((aLog size) - 2))  reverseDo: [ :char |
		char = $) ifTrue: [ foundPatches := true. ] ifFalse: [ 
			(foundPatches and: (donePatches not)) ifTrue: [ 
				char = $( ifTrue: [ donePatches :=  true.] ifFalse: [patchesPart := (char asString), patchesPart.]]
				ifFalse: [labelPart := (char asString), labelPart.].
		].
	].
	^ Array with:labelPart with:patchesPart with:successPart
"
	| labelPart rest patchesPart successPart|
	('*(*' match: aLog)
		ifFalse: [ ^ Error ].
	labelPart := (aLog splitOn: '(') last.
	rest := (aLog splitOn: '(') second.
	patchesPart  := (rest splitOn: ')') last.
	successPart  := (rest splitOn: ')') second.
	Halt now.
	^ Array with:labelPart with:patchesPart with:successPart"