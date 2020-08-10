Concrete log object representing an rule step execution

Constructor: / (Should always be instanciated by factory)

Instance variables:
- label: represents the rule name
- patches: represents the number of times the rule was executed
- successed: 0 or 1 representing if things went well
	
Methods:
- `setUp`: Initialize the instance variables
- `printOn: aStream` prints simply the value of `label` on the stream
- `splitLine: aLog` splits the original log line to extract all the variables (used by `setUp`)