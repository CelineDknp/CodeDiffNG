adding
addLabel: aString to: dict
	| index label cleanStr|
	cleanStr := self stripString: aString.
	index := self getNumberFirst: cleanStr.
	label := self extractStrBetween: $" from: cleanStr.
	dict at: (index asNumber) put: label.
	^ index
	