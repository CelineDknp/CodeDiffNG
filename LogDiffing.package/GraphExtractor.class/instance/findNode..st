adding
findNode: str
	|index result|
	index := self getNumberFirst: str.
	result := self graph select:[ :each | (each index = index)].
	result ifNotNil: [ ^ (result first) ] ifNil: [ ^ nil ].