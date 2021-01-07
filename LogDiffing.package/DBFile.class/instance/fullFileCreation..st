extraction
fullFileCreation: directoryName
	|logs|
	logs := self extractLog. dirOutput := directoryName.
	(baseName, versionNumber,'cleaned.txt') writeStreamDo: [ :stream |
    logs do: [ :each | each printOn: stream. stream nextPutAll: ''; cr.] ].