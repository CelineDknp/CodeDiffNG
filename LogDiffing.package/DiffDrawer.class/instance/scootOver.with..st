drawing
scootOver: allNodes with: dictionary
allNodes do: [ :currNode |
	|currShape|
	currShape := dictionary at: currNode.
	currNode links do: [ :currLink |
		|toShape|
		toShape := dictionary at: (currLink to).
		"If the difference of X values is more than 2 times the horizontal spacing and they have a close Y value, links probability overlap"
		(((currShape matrix x - toShape matrix x)abs > (horizontalSpacing*2)) and: ((currShape matrix y - toShape matrix y) abs < verticalSpacing)) ifTrue:[ 
			currShape translateBy: 0 @ -100]."This link goes backward, scoot (always up, might need some rework"
	].
].