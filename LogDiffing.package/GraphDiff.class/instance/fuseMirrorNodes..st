as yet unclassified
fuseMirrorNodes: aNode
	|mirrorArray|
	mirrorArray := aNode getMirrorChildren.
	^ self fuseMirrorNodes: aNode with: mirrorArray. 