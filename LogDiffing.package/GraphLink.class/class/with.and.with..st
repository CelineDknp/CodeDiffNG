instance creation
with: aNode and: anotherNode with: prob
	^ self new 
		from: aNode;
		to: anotherNode;
		probability: prob asNumber;
		yourself.