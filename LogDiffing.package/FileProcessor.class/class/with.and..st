instance creation
with: aFileV1 and: aFileV2
	^ self new
		fileV1: aFileV1;
		fileV2: aFileV2;
		setUp;
		yourself