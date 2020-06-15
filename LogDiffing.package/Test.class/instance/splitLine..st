initialization
splitLine: log
	| labelPart rest patchesPart successPart|
	('*(*' match: log)
		ifFalse: [ ^ Error ].
	labelPart := (log splitOn: '(') first.
	rest := (log splitOn: '(') second.
	patchesPart  := (rest splitOn: ')') first.
	successPart  := (rest splitOn: ')') second.
	^ Array with:labelPart with:patchesPart with:successPart