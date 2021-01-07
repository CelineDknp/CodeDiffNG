adding
addLegend: aCanvas
	legend := RSLegend new.
	legend title: 'Color code'.
	legend 	text: 'Added' withBoxColor: Color green;
				text: 'Removed' withBoxColor: Color red;
				text: 'Modified' withBoxColor: Color orange.
				"text: 'Line width indicates change weight'."
	legend legendDo: [ :l | l withBorder; padding: 20 ].
	legend layout horizontal gapSize: 30.
	legend location top left.
	legend container: aCanvas.
	legend build.