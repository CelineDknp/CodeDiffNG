drawing
scootOver: allNodes with: dictionary layout: aLayout
	allNodes do: [ :currNode |
		|currShape|
		currShape := dictionary at: currNode.
		currNode links do: [ :currLink |
			|toShape|
			toShape := dictionary at: (currLink to).
			"If the difference of X/Y values is more than 2 times the horizontal spacing and they have a close Y value, links probability overlap"
			aLayout = 'horizontalTree' ifTrue: [
				(((currShape matrix x - toShape matrix x)abs > (horizontalSpacing*2)) and: ((currShape matrix y - toShape matrix y) abs < (verticalSpacing*2))) ifTrue:[ 
					currShape translateBy: 0 @ -100]."This link goes backward, scoot (always up, might need some rework)"
				].
			aLayout = 'tree' ifTrue: [ 
				(((currShape matrix y - toShape matrix y)abs > (horizontalSpacing*2)) and: ((currShape matrix x - toShape matrix x) abs < (verticalSpacing*2))) ifTrue:[ 
				currShape translateBy: -100 @ 0]."This link goes backward, scoot (always left, might need some rework)"
				].
			].
		].