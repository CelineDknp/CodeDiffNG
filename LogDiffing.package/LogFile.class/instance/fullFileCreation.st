extraction
fullFileCreation
	|logs|
	logs := self extractLog.
	(self sourceFile, 'cleaned.txt') asFileReference writeStreamDo: [ :stream |
    logs do: [ :each | each printOn: stream. stream nextPutAll: ''; cr.] ].