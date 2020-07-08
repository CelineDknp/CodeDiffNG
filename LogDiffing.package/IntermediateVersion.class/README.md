Concrete log object representing an indermediate version

Constructor: / (Should always be instanciated by factory)

Instance variables:
- number: number corresponding to the "absolute" number of this version (first instance of log is 1,...)
- version: version of this log. Either a major one (rea, reb,...) or a sub-version of a major one (0001, 0002,...)
	
Methods:
- `isMajorVersion`: Returns true if `versions` contains no number
- `setUp`: Initialize the instance variables
- `strValue`: Just "Intermediate version" then next line
- `printOn: aStream`: prints simply the "Intermedate version" on the stream