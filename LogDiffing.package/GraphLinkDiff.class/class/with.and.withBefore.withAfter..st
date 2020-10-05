accessing
with: nodeFrom and: nodeTo withBefore: probabilityB withAfter: probabilityA
	|test|
	test := self with: nodeFrom and: nodeTo.
	test	probabilityAfter: probabilityA.
	test probabilityBefore: probabilityB.
	^ test.