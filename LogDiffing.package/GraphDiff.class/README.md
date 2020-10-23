GraphDiff object, extending the GraphExtractor

Constructor: GraphDiff with: aFileV1 and: aFileV2

Instance variables:
- nextIndex, used to re-index the nodes and their label
- targetFile, file to output the new .dot version of this graph 

Methods:
- `addNode: aNode`: Overrides existing method to deal with indexes and setting up initial/terminal nodes.
- `extractToFile`: creates a `targetFile`.dot file containing all the information of the diff'ed graph. Uses:
	- `labelLine: aKey and: aValue`: create a line for the dot file concerning a label
	- `linkLine: aLink`: create a line for the dotfile concerning a link
- `links: aLink`: add `aLink` to the link array. 
- `setUp: aFileV1 and: aFileV2` instanciate all needed variables.
- `mainGraph`: returns the main graph of this object
- `cleanCopy`: returns a new GraphDiff object that's a clean (deep) copy of this object
