instance creation
with: aDirectoryV1 and: aDirectoryV2 db: aBoolean
	^ self new 
		dir1: aDirectoryV1;
		dir2: aDirectoryV2;
		dbMode: aBoolean;
		yourself.