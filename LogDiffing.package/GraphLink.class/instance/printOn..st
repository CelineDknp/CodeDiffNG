printing
printOn: aStream
	<category: 'printing'>
   super printOn: aStream.
   "aStream nextPutAll: ' from: '."
   from printOn: aStream.
   aStream nextPutAll:'->'. "' to: '."
	to printOn: aStream.