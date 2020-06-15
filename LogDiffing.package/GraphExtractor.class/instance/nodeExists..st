accessing
nodeExists: str
	| targetIndex |
	targetIndex := self getNumberFirst: str.
	^ self graph anySatisfy: [ :each | each index = targetIndex ]