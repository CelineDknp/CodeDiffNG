instance creation
with: str
	('*:tmp/*' match: str) ifTrue: "We have an intermidate step"
		[ ^ IntermediateVersion new
			originalText: str;
			setUp. ]
		ifFalse: [ 
			('* (*) *' match: str) ifTrue: "We have an rule step"
				[ ^ Test new
				originalText: str;
				setUp. ]
			ifFalse: [^ str ] ]