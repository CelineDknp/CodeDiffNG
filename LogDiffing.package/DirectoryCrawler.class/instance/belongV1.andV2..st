crawl
belongV1: aStringV1 andV2: aStringV2
	(('*v1*' match: aStringV1) and: ('*v2*' match: aStringV2)) ifTrue: [
		|count|
		count := 0.
		aStringV1 doWithIndex:[ :char1 :index1 |
			|char2|
			char2 := aStringV2 at: index1.
			(char1 = char2) ifFalse: [ count := count+1.]
		].
		^ count = 1.
	] ifFalse: [ ^ false. ].