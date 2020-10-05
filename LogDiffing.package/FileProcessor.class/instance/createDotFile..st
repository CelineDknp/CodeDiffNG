fileCreation
createDotFile: aFileName
	| outputFile |
	outputFile := aFileName copyFrom: 1 to: ((aFileName size) - 11).
	outputFiles add: (outputFile,'.dot').
	^WinProcess resultOfCommand: 'java -jar synoptic.jar ', aFileName , ' -o ', outputFile.