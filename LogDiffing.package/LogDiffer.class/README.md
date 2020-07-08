LogDiffer object (will abstract the pipeline)

Constructor: LogDiffer with: aFileV1 and: aFileV2

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

Methods: 
- `setUp`: instantiate variables graph1/2, pathsG1/2, uniqueNodeG1/2 and commonNode (empty array) 
- `computeAddedNode`: loops trough all nodes and finds the added ones (fills variable addedNodes) 
- `computeCommonNode`: loops trough all nodes and finds the common ones (fills variable commonNodes) 
- `computeRemovedNode`: loops trough all nodes and finds the removed ones (fills variable removedNodes) 
- `computesCommonPaths`: loops through all paths to compute the common ones (fills variable commonPaths) Uses: 
	- `areCommon: aPath and: anotherPath`: returns true if both paths are the same.
