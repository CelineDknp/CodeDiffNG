fileCreation
createDotFiles
	|allFiles currentFile|
	allFiles := (FileSystem disk workingDirectory / (logFileV1 dirOutput)) allChildren.
	allFiles do: [ :file |
		file isFile ifTrue: [ 
			currentFile := (file path at: ((file path size)-1)), '/',(file path at: file path size).
			self createDotFile: currentFile. 
		].
	].