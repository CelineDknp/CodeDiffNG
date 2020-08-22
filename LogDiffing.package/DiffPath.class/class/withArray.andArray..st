class initialization
withArray: anArray andArray: anotherArray
	^self new
	setUp;
	addArray: anArray andArray: anotherArray;
	yourself.