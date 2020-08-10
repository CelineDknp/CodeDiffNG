printing
printOn: aStream 
    (self version) ifNotNil: [ 
    ^ aStream nextPutAll: 'Intermediate version '
					"nextPutAll: (self version);
					nextPutAll: ' (';
					nextPutAll: self number;
					nextPutAll: ')'"
	].
	self storeOn: aStream.