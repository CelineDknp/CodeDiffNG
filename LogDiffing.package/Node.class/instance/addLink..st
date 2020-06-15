adding
addLink: aLink
	(self emptyLinks) ifTrue:[ links := OrderedCollection with: aLink. ]
	ifFalse: [ links add: aLink. ].
	