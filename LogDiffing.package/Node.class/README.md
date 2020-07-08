An object representing a Node of the graph 

Constructors:
- Node with: aLabelString
- Node with: aLabelString index: anIndex

Instance variables:
- label: the node label
- index: the node index
- links: an array containing the links to other nodes
- terminal: boolean, true if the node is the terminal node
- initial: boolean, true if the node is the initial node 

Methods:
- `setUpv: initialize the variables (terminal, initial, links)
- `addLink: aString`: add a link to the links array
- `emptyLinks`: retruns true if links array is uninitialized (depraciated)