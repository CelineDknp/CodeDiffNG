Class for generating the visual graphs for the diffs

Constructor: DiffDrawer with: aLogDiffer.

Instance variables:
	- differ: variable containing the differ object
	- nodeModel: model of a graph node
	- canvas: canvas used to draw in 
	- layout: layout used for the node. Uses:
		- verticalSpacing: spacing vertical between nodes (base is 100)
		- horizontalSpacing: spacing horizontal between nodes (base is 50)
		
Methods:
	- `drawIndividual` draws all the graph on the canvas Uses:
		- `addLineBetween: aShape and: anotherShape withLink: aLink`: Add and draws a link between two nodes on the canvas
		- `createOrGetNode: aNode with: aDict`: Create a new shape on the canvas corresponding to the node or get the already existing shape from the dict 