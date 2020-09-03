Object encompassing a path within a graph. Essentially a wrapper around an array allowing to calculate the levenshtein distance used in the heuristic
Constructor:
- DiffPath with: aNode
- DiffPath with: anArray andArray: anotherArray (anArray with the node indexes, anotherArray with the nodes) 


Instances variables:
- `allIndexes` an array containing all indexes of the path (more space and memory efficient)
- `allNodes` an array containing all nodes of the path with all the details needed


Methods:
- `add: aNode`: Add `aNode` to the paths (in both arrays)
- `addArray: anArray andArray:anotherArray`: copies `anArray` into `allIndexes` and `anotherArray` into `allNodes`
- `at: anIndex`: returns the index value (from `allIndexes`) at `anIndex`
- `copy`: performs a deep copy of this object
- `firstOccurence: aNode`: returns a number corresponding to the first occurence of `aNode` in this path (-1 if not in path).
- `includes: aNode`: returns true if `aNode` is in the path, false if not.
- `isLastNode: aNode`: returns true if `aNode` is the last node of this path.
- `last`: retruns the index of the last node of this path.
- `levenshteinDistanceBetween: str1 and: str2`: returns the "normal" levenshtein distance between `str1` and `str2` (taken from wiki)
- `levenshteinDistanceWith: anotherPath `: returns the modified levenshtein distance between this path and `anotherPath`
- `nodeArray`: returns the array with the node corresponding to the path
- `setUp`: initialize the arrays for this path.
- `size`: returns the size of this path.
