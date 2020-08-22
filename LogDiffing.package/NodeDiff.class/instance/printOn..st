printing
printOn: aStream
	<category: 'printing'>
	status = 'added' ifTrue:[ '+' printOn: aStream].
	status = 'removed' ifTrue:[ '-' printOn: aStream].
   super printOn: aStream.