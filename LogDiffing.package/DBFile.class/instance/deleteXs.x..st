extraction
deleteXs: anArray x: anInteger
	|lastX current toRemove duplicated|
	lastX := OrderedCollection new.
	toRemove := OrderedCollection new.
	duplicated := false.
	1 to: ((anArray size)-anInteger) by:anInteger do:[:index |
		current := OrderedCollection new.
		0 to: (anInteger-1) do: [ :added|
			current add: (anArray at: index+added).
		].
		(self areEquivalent: lastX and: current) ifTrue:[
			duplicated ifFalse: [ duplicated := true. ] ifTrue: [ toRemove addAll: current. ].
		] ifFalse: [ duplicated := false.].
		lastX := current.
	].
	2 to: ((anArray size)-anInteger) by:anInteger do:[:index |
		current := OrderedCollection new.
		0 to: (anInteger-1) do: [ :added|
			current add: (anArray at: index+added).
		].
		(self areEquivalent: lastX and: current) ifTrue:[
			duplicated ifFalse: [ duplicated := true. ] ifTrue: [ toRemove addAll: current. ].
		] ifFalse: [ duplicated := false.].
		lastX := current.
	].
	toRemove do: [ :elem |
		anArray remove: elem ifAbsent:[].
	].