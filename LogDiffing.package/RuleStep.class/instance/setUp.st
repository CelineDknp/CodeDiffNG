initialization
setUp
	| tab numbermatch |
	tab := self splitLine: originalText.
	(tab size = 3) ifFalse: [ ^ self ].
	label := tab at: 1.	"First element in full is the label"
	numbermatch := '\d*' asRegex.
	numbermatch matchesPrefix: (tab at: 2).
   patches := (numbermatch subexpression: 1) asNumber.	"Number of patches."
	successed := tab at: 3.