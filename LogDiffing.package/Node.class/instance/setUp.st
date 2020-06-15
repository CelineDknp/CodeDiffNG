initialization
setUp
(self label = 'INITIAL') ifTrue: [ self initial: true ].
(self label = 'TERMINAL') ifTrue: [ self terminal: true ].
links := OrderedCollection new.