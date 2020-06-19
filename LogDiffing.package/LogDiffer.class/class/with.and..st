instance creation
with: aFile and: anotherFile

	^ self new
		file1: aFile;
		file2: anotherFile;
		setUp;
		yourself.