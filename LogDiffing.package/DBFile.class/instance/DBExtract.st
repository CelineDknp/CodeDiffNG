extraction
DBExtract
	|test fullCommand|
	fullCommand := 'java -jar DBExtractor.jar "', sourceFile, '" "',sourceFile asFileReference base,'" ', versionNumber.
	test := WinProcess resultOfCommand: fullCommand.