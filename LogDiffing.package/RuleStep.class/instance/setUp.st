initialization
setUp
	| tab |
	tab := self splitLine: originalText.
	(tab size = 3)
		ifFalse: [ ^ self ].
	label := tab at: 1.	"First element in full is the label"
	patches := tab at: 2.	"Number of patches. TODO, extract number"
	successed := tab at: 3