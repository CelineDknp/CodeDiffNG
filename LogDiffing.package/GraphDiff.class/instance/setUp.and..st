initialization
setUp: fileV1 and: fileV2
	self targetFile: ((fileV1 fullName) copyFrom: 1 to: ((fileV1 fullName) size) -4), 'Diff', (fileV2 base),'.dot'.
	self setUpVariables.