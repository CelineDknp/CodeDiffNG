extraction
extractLog
	| logText allLogObjects outputDirectory|
	self DBExtract.
	outputDirectory := (FileSystem disk workingDirectory) / (sourceFile asFileReference base).
	tempFile :=  outputDirectory / ((sourceFile asFileReference base), versionNumber, 'temp.txt').
	baseName := (outputDirectory / (sourceFile asFileReference base)).
	logText := self fileContent.
	allLogObjects := OrderedCollection new.
	self totalLines: logText size.
	logText do: [ :line | 
		allLogObjects add: ( self processLine: line).
	].
	1 to: 10 do:[:xVal | self deleteXs: allLogObjects x: xVal ].
	1 to: 10 do:[:xVal | self deleteXs: allLogObjects x: xVal ].
	1 to: 10 do:[:xVal | self deleteXs: allLogObjects x: xVal ].
	self deleteDupe: allLogObjects.
	1 to: 10 do:[:xVal | self deleteXs: allLogObjects x: xVal ].
	tempFile delete.
	^ allLogObjects.