as yet unclassified
drawCurrentBytecodeOn: clippedCanvas fromHeight: y
	| bc |
	bc := [ gdb currentBytecode printString ]
		on: Error do: [ '???' ].
	clippedCanvas
		drawString: bc
		at: (self bounds topLeft + (0 @ y))
		font: (LogicalFont familyName: 'Bitmap DejaVu Sans' pointSize: 12)
		color: Color black.
	^y + 14