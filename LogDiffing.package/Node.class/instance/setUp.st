initialization
setUp
(self label = 'INITIAL') ifTrue: [ self initial: true ] ifFalse: [ self initial: false ].
(self label = 'TERMINAL') ifTrue: [ self terminal: true ] ifFalse: [ self terminal: false ].
links := OrderedCollection new.