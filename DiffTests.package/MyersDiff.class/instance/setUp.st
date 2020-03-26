initialization
setUp

	tabA := file1 contents lines.
	tabB := file2 contents lines.
	frontier := Dictionary new.
	frontier at:1 put:(Frontier with: 0 and: OrderedCollection new).
	insertion := 'Insert'.
	deletion := 'Remove'.
	keeping := 'Keep'