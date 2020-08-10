printing
printOn: aStream
	<category: 'printing'>
   super printOn: aStream.
	index printOn: aStream.
   aStream nextPutAll: ' ('.
   label printOn: aStream.
   aStream nextPutAll: ')'.