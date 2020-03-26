utilities
constructLine:instruction data: data
	|stream|
	stream := String new writeStream.
	stream
		nextPutAll:instruction;
		nextPutAll: ' ';
		nextPutAll:data.
	^ stream contents