utilities
extractStrBetween: char from: aString
	| start result |
	start := false.
	result := ''.
	(1 to: (aString size)) do: [ :index | 
		start ifTrue: [ "We are extracting"
			(aString at: index) = char ifTrue: [ ^ result ]
			ifFalse: [ result := result,((aString at:index) asString)] 
		]
		ifFalse: [ 
			(aString at: index) = char ifTrue: [ start := true ]
		].
	].
	^ result.