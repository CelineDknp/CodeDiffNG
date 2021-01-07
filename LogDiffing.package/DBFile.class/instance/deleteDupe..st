extraction
deleteDupe: anArray
 	|last toRemove|
	toRemove := OrderedCollection new.
	last := ''.
	anArray do: [ :current |
		current label = last ifTrue:[toRemove add: current. ].
		last := current label.
	].
	anArray removeAll: toRemove.