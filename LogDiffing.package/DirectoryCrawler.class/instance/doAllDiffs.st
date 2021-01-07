crawl
doAllDiffs
	allDiffs do: [ :each |
		each createGraphDiff. 
		each postProcess.
		each extractDiffToFile.
	 ]