accessing
noLoop: path next: node
	^ path noneSatisfy: [ :each | node = each ]