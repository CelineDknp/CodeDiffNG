printing
printOn: aStream
	<category: 'printing'>
   super printOn: aStream.
	(self label) printOn: aStream.