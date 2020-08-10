accessing
firstOccurence: aNode
|result|
result := 0.
allIndexes do: [ :each |
	result := result+1.
	(each = (aNode index)) ifTrue: [ ^ result ].
 ].
^ -1.