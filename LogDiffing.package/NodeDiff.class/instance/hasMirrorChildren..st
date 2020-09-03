testing
hasMirrorChildren: childList
	childList do: [ :eachChild1 |
		childList do: [ :eachChild2 |
			((eachChild1 ~= eachChild2) and:((eachChild1 label) = (eachChild2 label))) ifTrue: [ 
				((((eachChild1 status) = 'added') and: ((eachChild2 status)='removed')) or: (((eachChild2 status) = 'added') and: ((eachChild1 status)='removed'))) ifTrue:[
					^ true.
				].
			].
		].
	].
	^ false.