printing
printOn: aStream 
	 | name | 
    (name := self version) ifNotNil: [ 
    ^ aStream nextPutAll: 'Intermediate version '
					"nextPutAll: name;
					nextPutAll: ' (';
					nextPutAll: self number;
					nextPutAll: ')'"
	].
	self storeOn: aStream