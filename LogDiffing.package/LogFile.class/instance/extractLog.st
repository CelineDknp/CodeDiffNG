extraction
extractLog
	| logText logInterest temp|
	logText := self fileContent.
	self totalLines: logText size.
	"First, let's get rid of all non-important lines"
	logInterest := logText select: [ :each | self isRelevantLog: each].
	"Then create and return all log objects"
	allLogs := logInterest collect: [ :each | LogLine with: each ].
	temp := allLogs select: [ : each | (each isMemberOf: IntermediateVersion) or: (each changedCode) ].
	self interestLines: temp size.
	^ temp.