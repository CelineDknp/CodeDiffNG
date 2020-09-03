testing
getMirrorLinks: linkList
	Halt now.
	linkList do: [ :eachLink1 |
		|to1|
		to1 := eachLink1 to.
		linkList do: [ :eachLink2 |
			|to2|
			to2 := eachLink2 to.
			((to1 = to2) and: (eachLink1 ~= eachLink2)) ifTrue: [ 
					^ OrderedCollection with: eachLink1 with: eachLink2.
			].
		].
	].
	^ nil.