tests
testInsert
	|result  diff|
	diff := MyersDiff with: 'D:\Projets\CodeDiffing\DiffFiles\fileA2.txt' and: 'D:\Projets\CodeDiffing\DiffFiles\fileA1.txt'.
	result := diff shortestEdit.
	self assert: result equals: (OrderedCollection with: 'Keep Line 1' with: 'Insert Line 2' with: 'Keep Line 3')