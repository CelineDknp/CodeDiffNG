crawl
createAllDiffs
	allDiffs := OrderedCollection new.
	allDirs do: [:fileProcess| 
		fileProcess outputFiles do:[ :each1 |
			fileProcess outputFiles do:[ :each2 |
			(self belongV1: each1 andV2: each2) ifTrue: [ allDiffs add: (LogDiffer with: each1 and: each2). ].
			
			].
		].
	].