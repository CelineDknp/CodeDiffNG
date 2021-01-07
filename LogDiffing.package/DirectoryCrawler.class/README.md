Class to crawl directories and create diffs (takes two directories in argument, and crawl them, matching potential files to diff)

Constructor: DirectoryCrawler with: 'dirV1' and: 'dirV2' db: aBoolean.

Instance variables:
	- dir1 & dir2
	- allDirs: OrderedCollection with all the FileProcessor objects corresponding to all directories containong files to diff
	- allDiffs: OrderedCollection with all the LogDiffer objects ready to be used.
	
Methods:
	- `crawl`: populates the `allDirs` variable
	- `createFull` & `createMultiple`: generate .dot files (full or multiple versions) to diff ! run before createAllDiffs !
	- `createAllDiffs`: populates the `allDiffs` variable by iterating trough `allDirs`. Uses:
		- `belongV1: aFileStr andV2: anotherFileStr`: returns true if the two files are two corresponding versions that need to be diffed.
	- `doAllDiffs`: for each LogDiffer in `allDiffs`, do the diff, the post-process and generate the output .dot file