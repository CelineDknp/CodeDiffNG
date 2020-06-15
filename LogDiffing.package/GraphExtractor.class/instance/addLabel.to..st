adding
addLabel: str to: dict
	| index label cleanStr|
	cleanStr := self stripString: str.
	index := self getNumberFirst: cleanStr.
	label := self extractStrBetween: $" from: cleanStr.
	dict at: (index asNumber) put: label.
	^ index
	