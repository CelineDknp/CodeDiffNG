extraction
fullFileCreation: directoryName
	|logs|
	logs := self extractLog. dirOutput := directoryName.
	(FileSystem disk workingDirectory / directoryName) ensureCreateDirectory.
	(self sourceFile, self versionNumber, 'cleaned.txt') asFileReference writeStreamDo: [ :stream |
    logs do: [ :each | each printOn: stream. stream nextPutAll: ''; cr.] ].