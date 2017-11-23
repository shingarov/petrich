as yet unclassified
drawCurrentInstructionOn: clippedCanvas fromHeight: y
	| pc nativeInstr |
	pc := regs at: 'pc'.
	nativeInstr := gdb currentInstruction.
	clippedCanvas
		drawString: nativeInstr printString
		at: (self bounds topLeft + (0 @ y))
		font: (LogicalFont familyName: 'Bitmap DejaVu Sans' pointSize: 12)
		color: Color black.
	^y + 14