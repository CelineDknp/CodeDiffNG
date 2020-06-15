extraction
extractLog
	| logText logInterest |
	logText := self fileContent contents lines.
	self totalLines: logText size.
	"First, let's get rid of all non-important lines"
	logInterest := logText select: [ :each | self isRelevantLog: each].
	self interestLines: logInterest size.
	"Then create and return all log objects"
	^ logInterest collect: [ :each | LogLine with: each ].