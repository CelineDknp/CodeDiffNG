instance creation
with: aFile version:aNumber
	^ self new
		sourceFile: aFile;
		versionNumber: aNumber;
		yourself