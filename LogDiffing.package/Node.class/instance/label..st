accessing
label: aValue
	|cleaned|
	cleaned := self stripString: aValue of: Character space. 
	label := cleaned.