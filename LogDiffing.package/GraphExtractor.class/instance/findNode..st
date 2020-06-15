adding
findNode: str
	|index|
	index := self getNumberFirst: str.
	self graph do: [ :each | (each index = index) ifTrue: [ ^ each ] ].