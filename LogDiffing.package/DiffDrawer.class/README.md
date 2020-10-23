Class for generating the visual graphs for the diffs

Constructor: DiffDrawer with: aLogDiffer.

Instance variables:
	- differ: variable containing the differ object
	- canvas: default canvas used to draw in 
	- layout: layout used for the node. Uses:
		- verticalSpacing: spacing vertical between nodes (base is 100)
		- horizontalSpacing: spacing horizontal between nodes (base is 50)
		
Methods:
	- `drawIndividual(: aRSCanvas)`  Calls:
		- `draw: aGraph (on: aRScanvas)`: draws all the graph on (`aRSCanvas)`/the canvas. Uses
			- `addLineBetween: aShape and: anotherShape withLink: aLink on: aRSCanvas`: Add and draws a link between two nodes on the canvas
			- `createOrGetNode: aNode with: aDict on: aRSCanvas with: aFusedDict`: Create a new shape on the canvas corresponding to the node or get the already existing shape from the dict. Uses:
				- `createShapeWith: aNode fused: aFusedDict`: creates the shape corresponding to the node (with correct color/label, etc)
			- `scootOver: allNodes with: aShapeDict` : Goes trough all the nodes and their corresponding shapes to see if they need to be moved to avoir crossing lines.
	- `drawAndColapse(: aRSCanvas)` Creates the `GraphFused` corresponding to the graph then calls `draw: aGraph (on: aRSCanvas)`.
	