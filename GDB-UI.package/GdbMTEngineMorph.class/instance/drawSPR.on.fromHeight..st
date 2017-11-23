as yet unclassified
drawSPR: spr on: clippedCanvas fromHeight: y
	clippedCanvas
		drawString: spr, ' = ', (regs at: spr) printString
		at: (self bounds topLeft + (0 @ y))
		font: (LogicalFont familyName: 'Bitmap DejaVu Sans' pointSize: 12)
		color: Color black.
	^y + 14	