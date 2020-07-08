extraction
multipleFileCreation
	|logs filename currentTab currentCol|
	logs := self extractLog.
	allParts := Dictionary new.
	logs do:[ :aLog |
		(aLog isMajorVersion) ifTrue: [ 
			filename := self fileContent, aLog version, 'cleaned.txt'.
			currentTab := OrderedCollection with: aLog.
			allParts at: filename put: currentTab.
		] ifFalse: [ 
		currentTab isNotNil ifTrue: [ currentTab add: aLog ]. 
		].
	].
	(allParts keys) do: [ :key |
		currentCol := allParts at: key.
		key asFileReference writeStreamDo: [ :stream |
    		currentCol do: [ :each | each printOn: stream. stream nextPutAll: ''; cr.] ].
	].