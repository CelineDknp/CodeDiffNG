utility
getNumberFirst: str
	| numbermatch |
	numbermatch := '\d*' asRegex.
	numbermatch matchesPrefix: str.
 	^ (numbermatch subexpression: 1) asNumber.