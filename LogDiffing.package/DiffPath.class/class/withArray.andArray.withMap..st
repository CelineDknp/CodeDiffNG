class initialization
withArray: anArray andArray: anotherArray withMap: aMap
	^self new
	setUp;
	addArray: anArray andArray: anotherArray withMap: aMap;
	yourself.