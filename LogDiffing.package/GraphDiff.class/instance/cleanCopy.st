accessing
cleanCopy
	|result idMap newLinks |
	result := GraphDiff new.
	result setUpVariables.
	idMap := Dictionary new.
	graph do: [ :node |
		|nodeCopy indexCopy|
		nodeCopy := NodeDiff with: node label.
		nodeCopy status: node status.
		"nodeCopy graphFrom: node graphFrom."
		indexCopy := result addNode: nodeCopy.
		idMap at: node index put: indexCopy.
		result labels at: nodeCopy index put: node index.
	].
	newLinks := OrderedCollection new.
	self links do: [ :link |
		|nodeTargetFrom nodeTargetTo newLink|
		nodeTargetFrom := result getNode: (idMap at: (link from index)).
		nodeTargetTo := result getNode: (idMap at: (link to index)).
		newLink := (GraphLinkDiff with: nodeTargetFrom and: nodeTargetTo withBefore: (link probabilityBefore ) withAfter: (link probabilityAfter)).
		newLink status: link status.
		newLinks add: newLink.
		nodeTargetFrom links add: newLink.
	].
	result links: newLinks.
	^ result.