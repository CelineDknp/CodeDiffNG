instance creation
with: aFile and: anotherFile cycles: cycleNumber heuristic: heuristicNumber and: minEditNumer

	^ self new
		file1: aFile;
		file2: anotherFile;
		setUp: cycleNumber withHeuristic: heuristicNumber and: minEditNumer;
		yourself.