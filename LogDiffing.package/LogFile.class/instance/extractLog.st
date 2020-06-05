extraction
extractLog
	| logText logInterest |
	logText := self fileContent contents lines.
	"First, let's get rid of all non-important lines"
	logInterest := logText select: [ :each | self isRelevantLog: each].
	"Then create and return all log objects"
	^ logInterest collect: [ :each | LogLine with: each ].