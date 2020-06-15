utility
stripString: str of: char
	|tmp|
	tmp := str.
	[(tmp at:1) = char] whileTrue: [ "Remove the character at the start"
		tmp := tmp copyFrom: 2 to: (tmp size).
	].

	[(tmp at:(tmp size)) = char] whileTrue: [ "Remove the character at the end"
		tmp := tmp copyFrom: 1 to: ((tmp size) -1).
	].

	^ tmp
	
	