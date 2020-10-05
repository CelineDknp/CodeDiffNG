crawl
crawl
	allDirs := OrderedCollection new.
	dir1 files do: [ :eachFileV1 |
		dir2 files do: [ :eachFileV2|
			|nameV1 nameV2|
			nameV1 := eachFileV1 path base.
			nameV2 := eachFileV2 path base.
			nameV1 = nameV2 ifTrue: [ 
				allDirs add: (FileProcessor with: (eachFileV1 pathString) and: (eachFileV2 pathString)).
			].
		]
	]