utilities
getAllPaths
	|paths|
	paths := OrderedCollection new.
	paths := self getAllCyclePaths: 0.
	^ paths.