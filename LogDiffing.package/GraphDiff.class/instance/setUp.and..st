initialization
setUp: fileV1 and: fileV2
	self targetFile: ((fileV1 asString) copyFrom: 8 to: ((fileV1 asString) size) -4), 'Diff', ((fileV2 asString) copyFrom: 8 to: ((fileV2 asString) size)).
	graph:= OrderedCollection new.
	labels:= Dictionary new.
	nextIndex := 0.