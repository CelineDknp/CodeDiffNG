extraction
multipleFileCreation: directoryName
	| logs filename currentTab currentCol |
	logs := self extractLog.
	allParts := Dictionary new.
	dirOutput := directoryName.
	(FileSystem disk workingDirectory / directoryName) ensureCreateDirectory.
	logs
		do: [ :aLog | 
			aLog isMajorVersion
				ifTrue: [ filename := directoryName,'/',(self sourceFile base), (self versionNumber) , aLog version , 'cleaned.txt'.
					currentTab := OrderedCollection with: aLog.
					allParts at: filename put: currentTab ]
				ifFalse: [ currentTab isNotNil
						ifTrue: [ currentTab add: aLog ] ] ].
	allParts
		keysDo: [ :key | 
			currentCol := allParts at: key.
			key asFileReference
				writeStreamDo: [ :stream | 
					currentCol
						do: [ :each | 
							each printOn: stream.
							stream nextPutAll: ''; cr 
							] ] ]