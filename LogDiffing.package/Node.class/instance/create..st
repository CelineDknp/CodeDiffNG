as yet unclassified
create: status
	|res|
	res := NodeDiff with: self label.
	res links: self links.
	res setStatus: status.
	^ res.