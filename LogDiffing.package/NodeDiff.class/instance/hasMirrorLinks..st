testing
hasMirrorLinks: linkList
	linkList
		do: [ :eachLink1 | 
			| to1 |
			to1 := eachLink1 to.
			linkList
				do: [ :eachLink2 | 
					| to2 |
					to2 := eachLink2 to.
					(to1 = to2 and: eachLink1 ~= eachLink2)
						ifTrue: [ ^ true ] ] ].
	^ false