utility
extractStrBetween: char from: str
	| start result |
	start := false.
	result := ''.
	(1 to: (str size)) do: [ :index | 
		start ifTrue: [ "We are extracting"
			(str at: index) = char ifTrue: [ ^ result ]
			ifFalse: [ result := result,((str at:index) asString)] 
		]
		ifFalse: [ 
			(str at: index) = char ifTrue: [ start := true ]
		].
	].
	^ result.