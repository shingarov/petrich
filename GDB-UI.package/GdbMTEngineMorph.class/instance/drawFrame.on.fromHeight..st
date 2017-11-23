as yet unclassified
drawFrame: fp on: clippedCanvas fromHeight: y
	| frame cm |
	frame := MTRemoteStackFrame gdb: gdb pointer: fp.
	cm := frame method.
	clippedCanvas
		drawString: cm selector symbol asString
		at: (self bounds topLeft + (0 @ y))
		font: (LogicalFont familyName: 'Bitmap DejaVu Sans' pointSize: 12)
		color: Color black.
	^y+20