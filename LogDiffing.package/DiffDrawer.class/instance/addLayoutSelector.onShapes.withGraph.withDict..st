adding
addLayoutSelector: aCanvas onShapes: shapes withGraph: graph withDict: dict
	|labels update|
	
	labels := #('horizontalTree' 'tree' 'force').
	layout := RSLayoutBuilder new.
	update := [ :sel | 
		layout perform: sel asSymbol.
		(sel = 'horizontalTree')
			ifTrue: [ layout layout verticalGap: verticalSpacing; 
			 horizontalGap: horizontalSpacing. ].
		(sel = 'tree')
			ifTrue: [ layout layout verticalGap: horizontalSpacing; 
			 horizontalGap: verticalSpacing. ].
		(sel = 'force')
			ifTrue: [ layout layout charge: -1500; 
			 length:100. ].
		layout on: shapes.
		self scootOver: graph with: dict layout: sel.
		 ].
	update value: #horizontalTree.
	labels := labels collect: [ :sel |
		RSLabel new
			isFixed: true;
			text: sel capitalized;
			when: RSMouseLeave do: [ :evt | evt shape 
				color: Color gray; 
				normal;
				signalUpdate ];
			when: RSMouseEnter do: [ :evt | evt shape 
				color: Color blue; 
				underline;
				signalUpdate ];
			when: RSMouseClick do: [ :evt | 
				update value: sel.
				aCanvas zoomToFit. ] ].
	aCanvas addAll: labels.
	RSHorizontalLineLayout on: labels.
