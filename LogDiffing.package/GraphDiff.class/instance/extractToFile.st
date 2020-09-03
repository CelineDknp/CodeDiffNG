fileExtraction
extractToFile

	(self targetFile) asFileReference writeStreamDo: [ :stream |
		stream nextPutAll: 'digraph G {'; cr.
    	labels keysAndValuesDo: [ :key :value | stream nextPutAll: (self labelLine: key and: value); cr.].
    	links do: [ :link | stream nextPutAll: (self linkLine: link); cr.].
		stream nextPutAll: '}'.
	].
	