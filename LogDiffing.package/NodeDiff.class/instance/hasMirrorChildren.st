testing
hasMirrorChildren
	links do: [ :eachLink1 |
		|child1|
		child1 := eachLink1 to.
		links do: [ :eachLink2 |
			|child2|
			child2 := eachLink2 to.
			((child1 label) = (child2 label)) ifTrue: [ 
				((((child1 status) = 'added') and: ((child2 status)='removed')) or: (((child2 status) = 'added') and: ((child1 status)='removed'))) ifTrue:[
					^ true.
				].
			].
		].
	].
	^ false.