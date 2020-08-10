utilities
getNumberFirst: aString
	| numbermatch |
	numbermatch := '\d*' asRegex.
	numbermatch matchesPrefix: aString.
 	^ (numbermatch subexpression: 1) asNumber.