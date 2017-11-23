as yet unclassified
drawGPRsOn: clippedCanvas
	| y |
	y := self drawGPRHeaderOn: clippedCanvas.
	0 to: 31 do: [ :r |
		| regName |
		regName := 'r', r printString.
		clippedCanvas
			drawString: regName, ' = ', (regs at: regName) printString
			at: (self bounds topLeft + (0 @ y))
			font: (LogicalFont familyName: 'Bitmap DejaVu Sans' pointSize: 12)
			color: Color black.
		y := y + 15.
		 ].
	^y
	