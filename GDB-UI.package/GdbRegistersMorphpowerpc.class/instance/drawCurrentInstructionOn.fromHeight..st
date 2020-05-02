drawing
drawCurrentInstructionOn: clippedCanvas fromHeight: y
	clippedCanvas
		drawString: self gdb currentInstruction printString
		at: (self bounds topLeft + (0 @ y))
		font: (LogicalFont familyName: 'Bitmap DejaVu Sans' pointSize: 12)
		color: Color black.
	^y + 14