utilities
needToGoDownWithK: k andD:d

	^ k == d negated or: [ k ~= d and: [ (frontier at:  k - 1) index < (frontier at: k + 1) index ] ]