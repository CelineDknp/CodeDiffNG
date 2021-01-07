crawl
crawl
	|addedPairs|
	addedPairs := OrderedCollection new.
	allDirs := OrderedCollection new.
	dir1 files do: [ :eachFileV1 |
		dir2 files do: [ :eachFileV2|
			|nameV1 nameV2 pair|
			nameV1 := eachFileV1 path base.
			nameV2 := eachFileV2 path base.
			pair := OrderedCollection with: nameV1 with: nameV2.
			((nameV1 = nameV2) and: ((addedPairs includes: pair)not)) ifTrue: [ 
				addedPairs add: pair.
				dbMode ifTrue: [  
					allDirs add: (FileProcessor withDB: (eachFileV1 pathString) and: (eachFileV2 pathString)).
				] ifFalse:[
					allDirs add: (FileProcessor with: (eachFileV1 pathString) and: (eachFileV2 pathString)).
				].
			].
		]
	]