LogDiffer object (will abstract the pipeline)

Constructor: 
 - LogDiffer with: aFileV1 and: aFileV2 (run with no cycle no pruning)
 - LogDiffer with: aFileV1 and: aFileV2 cycles: maxCyclesNumber (run with cycles up to max no pruning)
 - LogDiffer with: aFileV1 and: aFileV2 cycles: maxCyclesNumber heuristic: startSize and: minEdit (run with cycles up to max pruning from startSize with a minimum edit of minEdit)

Instance variables: 
- file1: String name of v1 of file 
- file2: String name of V2 of file 
- graph1: GraphExtractor of file1 
- graph2: GraphExtractor of file2 
- pathsG1: all paths of graph1 
- pathsG2: all paths of graph2 
- uniqueG1: all unique nodes of graph1 
- uniqueG2: all unique nodes of graph2 
- commonPaths: paths in common between graph1 and graph2 
- commonNodes: Nodes in common between graph1 and graph2 
- addedNodes: Nodes not in graph1 but in graph2 
- removedNodes: Nodes in graph1 but not in graph2
- graphDiff: GraphDiff object contining the result of the diff of `graph1` and `graph2`

Methods: 
- `setUp(: cycles (withHeuristic: heuristic and: minEdit))`: instantiate variables graph1/2, pathsG1/2 (with no cycles, with `cycles`, by pruning with `heuristic`), uniqueNodeG1/2 and commonNode (empty array) 
- `computeAll`: computes all necessary infos for creating the diff graph (in the right order) Uses:
	- `computesCommonPaths`: loops through all paths to compute the common ones (fills variable commonPaths) ! should be ran first ! Uses: 
		- `areCommon: aPath and: anotherPath`: returns true if both paths are the same.
	- `computeAddedNode`: loops trough all nodes and finds the added ones (fills variable addedNodes) 
	- `computeCommonNode`: loops trough all nodes and finds the common ones (fills variable commonNodes) 
	- `computeRemovedNode`: loops trough all nodes and finds the removed ones (fills variable removedNodes) 
- `createGraphDiff(AndExport)`: constructs the diff in `graphDiff` (and exports it to a .dot file). Uses:
	- `commonEquivalent: aNode`: returns the common node equivalent to specified node (of either gaph1 or graph2).
	- `addedEquivalent: aNode`: returns the added node equivalent to specified node (of either gaph1 or graph2)
	- `removedEquivalent: aNode`: returns the removed node equivalent to specified node (of either gaph1 or graph2)
	- `commonInclude: allValues withArray: anArray` ?
	- `IsIn: anArray node: aNode`: returns true if `aNode` is in `anArray` (violent include override. Maybe override equals ?)
	