Object to abstract a log line (factory)

Constructor: LogLine with: aLogString

Instance variables:
- originalText: the string given to the constructor
	
Methods:
- `isMajorVersion`: Always returns false, overwritten by the subclass `IntermediateVersion`
- `setUp`: Must be overwritten by subclasses
- `strValue`: Implemented by all subclasses, in this case an empty String