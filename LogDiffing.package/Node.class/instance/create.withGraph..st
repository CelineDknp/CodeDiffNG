as yet unclassified
create: status withGraph: graph
	|res|
	res := NodeDiff with: self label.
	res graphFrom: graph.
	res setStatus: status.
	^ res.