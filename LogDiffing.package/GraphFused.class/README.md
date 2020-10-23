GraphFused object, extending a GraphExtractor and using GraphDiff.

Constructor: GraphFused with: aDiffGraph

Variables: 
- initialGraph: a copy of the initial diffGraph
- fused: a boolean used by `fuseRound: aNode processed: aDict`

Methods:
- `fuse`: Calls `fuseRound: aNode processed: aDict` until no fuse is possible anymore (boolean `fused` is monitoring this)
	- `fuseRound: aNode processed: aDict`: fuses the node if possible, then launches all necessary fusion of its children. Uses:
		- `canFuse: aNode`: returns true if the node can be fused (it has no changed probability links coming from or to it)
		- `getInitialEquivalent: aNode`: saves the initial state of the node in a dict (to be used in FusedNode)
		- `updateLinks: aNode`: updates the links of the node, removing the ones that are no longer needed (point inside of a fused node) or resseting their origin when a node was fused 