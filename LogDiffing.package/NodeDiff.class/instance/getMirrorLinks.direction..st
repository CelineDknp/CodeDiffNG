testing
getMirrorLinks: linkList direction: dir
	linkList do: [ :eachLink1 |
		|target1|
		dir = #to ifTrue:[
			target1 := eachLink1 to.
		].
		dir = #from ifTrue:[
			target1 := eachLink1 from.
		].
		linkList do: [ :eachLink2 |
			|target2|
			dir = #to ifTrue:[
				target2 := eachLink2 to.
			].
			dir = #from ifTrue:[
				target2 := eachLink2 from.
			].
			((target1 = target2) and: (eachLink1 ~= eachLink2)) ifTrue: [ 
					^ OrderedCollection with: eachLink1 with: eachLink2.
			].
		].
	].
	^ nil.