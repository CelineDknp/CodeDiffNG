accessing
label 
	|result|
	result := ''.
	nodeContained do: [ :node | result := (result, (node label), (String with: Character cr)) ].
	^ result.