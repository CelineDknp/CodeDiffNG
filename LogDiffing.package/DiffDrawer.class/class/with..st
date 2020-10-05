instance creation
with: aDiffer
	^ self new
	differ: aDiffer;
	nodeModel:[ :m | 
		RSEllipse new
			border: RSBorder new; 
			draggable;
			labeled;
			size: 40;
			model: m;
			yourself];
	canvas: 'notUsed';
	spacing: 50 horizontal: 100;
	layout: 'notUsed'
	yourself.