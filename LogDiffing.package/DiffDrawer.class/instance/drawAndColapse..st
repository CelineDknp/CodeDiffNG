drawing
drawAndColapse: aRSCanvas 
	|graphCollapsed|
	graphCollapsed := GraphFused with: (differ graphDiff).
	graphCollapsed fuse.
	^ self draw: graphCollapsed on: aRSCanvas.