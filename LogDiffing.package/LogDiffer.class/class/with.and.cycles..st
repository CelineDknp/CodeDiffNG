instance creation
with: aFile and: anotherFile cycles: cycleNumber

	^ self new
		file1: aFile;
		file2: anotherFile;
		setUp: cycleNumber;
		yourself.