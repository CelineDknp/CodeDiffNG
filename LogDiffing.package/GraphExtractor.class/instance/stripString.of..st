utilities
stripString: aString of: aCharacter
	|tmp|
	tmp := aString.
	[(tmp at:1) = aCharacter] whileTrue: [ "Remove the character at the start"
		tmp := tmp copyFrom: 2 to: (tmp size).
	].

	[(tmp at:(tmp size)) = aCharacter] whileTrue: [ "Remove the character at the end"
		tmp := tmp copyFrom: 1 to: ((tmp size) -1).
	].

	^ tmp
	
	