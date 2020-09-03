heuristic
levenshteinDistanceWith: otherPath 
	
	"Iterative calculation of the Levenshtein distance between two strings. found at : https://en.wikibooks.org/wiki/Algorithm_Implementation/Strings/Levenshtein_distance#Smalltalk then modified a bit"
	
	| arrayTwo arrayOne maxSize|
	" degenerate cases"
	self = otherPath 
		ifTrue:[^0].
	(otherPath size) = 0 
		ifTrue:[^(self size)].
	(self size) = 0 
		ifTrue:[^(otherPath size)].
	
	"create two work vectors of integer distances"
	((self size) <= (otherPath size)) ifTrue: [ maxSize := (self size)+1 ] ifFalse:[ maxSize := (otherPath size)+1].
	arrayOne := Array new: maxSize.
	arrayTwo := Array new: maxSize.
	
	"initialize v0 (the previous row of distances)
    	this row is A[0][i]: edit distance for an empty s
    	the distance is just the number of characters to delete from t"
	(1 to: (arrayOne size)) do:[ :i | arrayOne at: i put: i-1 ].
	
	(1 to: (self size)) do: [ : i | 	
		" calculate v1 (current row distances) from the previous row v0
		first element of v1 is A[i+1][0] edit distance is delete (i+1) chars from s to match empty t"
  		arrayTwo at: 1 put: i.
		
		 " use formula to fill in the rest of the row"
		(1 to: (maxSize -1)) do: [ :j || cost minimum minimumAux |
			((self at: i) = (otherPath at: j)) 
				ifTrue:[cost:=0]
				ifFalse:[cost:=1].			
			minimumAux := ((arrayTwo at: j) + 1) min: ((arrayOne at: (j+1)) + 1).
			minimum :=  minimumAux min: ((arrayOne at: j) + cost).
			arrayTwo at: (j+1) put: minimum.].
		
		(1 to: (arrayOne size)) do: [ :j | arrayOne at: j put: (arrayTwo at: j) ].
		
		].

	^arrayTwo at: maxSize.