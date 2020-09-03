processing
fuseNode: node1 and: node2
	| allLinks result|
	allLinks := (node1 links).
	allLinks addAll: node2 links.
	result := NodeDiff with: (node1 label) index: (node1 index).
	allLinks do:[:each| each from: result].
	result links: allLinks .
	result status: 'common'.
	^ result.