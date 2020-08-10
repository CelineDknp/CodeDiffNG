printing
printOn: aStream 
	 | name | 
    (name := self label) ifNotNil: [ 
    ^ aStream nextPutAll: name.
	].
	self storeOn: aStream.