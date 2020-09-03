testing
isIn: array node: node

	^array anySatisfy: [ :each | (each label = node label)].