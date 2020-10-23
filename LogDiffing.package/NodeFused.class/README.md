Extension of Node object for GraphFused

Constructor: NodeFused with: aNodeDiff

Variables:
	- nodeContained: array with all the nodes embedded in this one
	- initialLinks: dictionary with all the initial states of the nodes contained in this one.
	
Methods:
	- `add: aNode initial: anInitialVersion`: add the node if it is a NodeDiff, or calls `fuseWith: aNodeFused` if necessary.
	- `cleanLinks: aNode` cleans the internal links of a node
	- `contains: aNode`: returns true if aNode is in this NodeFused
	- `containsInitial`/`containsTerminal`: returns true if this node contains the initial/terminal node of the graph