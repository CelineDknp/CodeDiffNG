utilities
shortestEdit
	"Loop trough possible moves"
	0 to: (self max) do: [ :d | 
		d negated to: d by: 2 do: [ :k | 
			(self needToGoDownWithK: k andD: d)
				ifTrue: [ "go down on the graph"
					self unpackDownWithK: k.
					(y between: 1 and: tabB size) ifTrue: [ history add: (self constructLine: insertion data:(tabB at: y)) ].
				]
				ifFalse: [ "go right on the graph"
					self unpackRightWithK: k.
					(x between: 1 and: tabA size) ifTrue: [ history add: (self constructLine: deletion data:(tabA at: x)) ].
					].
			
			[ self canMoveDiagonally ] whileTrue: [ "move diagonally for free"
				x := x + 1. y := y + 1.
				history add: (self constructLine: keeping data: (tabA at: x))].
				
			(x >= tabA size and: (y >= tabB size)) "if done, return. Else, keep iterating"
				ifTrue: [ ^ history ] 
				ifFalse: [ frontier at: k put: (Frontier with: x and: history)] ] ]