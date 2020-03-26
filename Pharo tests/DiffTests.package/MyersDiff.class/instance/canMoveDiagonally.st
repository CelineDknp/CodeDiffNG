utilities
canMoveDiagonally

	^ x < tabA size and: (y < tabB size and: [ (tabA at: x + 1) = (tabB at: y + 1) ])