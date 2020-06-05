extraction
isRelevantLog: line
	('*WARNING:*' match: line) ifTrue: [ ^ false ].
	('*[INFO]*' match: line) ifTrue: [ ^ false ].
	('*BUG*' match: line) ifTrue: [ ^ false ].
	('*failed*' match: line) ifTrue: [ ^ false ].
	('*CopyBook*' match: line) ifTrue: [ ^ false ].
	('*lines*stat*GOTOsNear*GOTOs*EVALs*loops' match: line) ifTrue: [ ^ false ].
	^ true.
	