printing
printOn: aStream 
	 ^ aStream 
            nextPutAll: 'Frontier (';
				nextPutAll: index printString;
				nextPutAll: ', ';
				nextPutAll: array printString;
				nextPutAll: ')'.