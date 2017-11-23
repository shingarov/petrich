as yet unclassified
drawVregsOn: clippedCanvas
	| y |
	y := self drawVRegHeaderOn: clippedCanvas.
	TAJWriter registerMap keysAndValuesDo: [ :vReg :physReg |
		| regName |
		regName := physReg isInteger ifTrue: ['r', physReg printString]
			ifFalse: [ physReg ].

		clippedCanvas
			drawString: vReg printString, ' = ', (regs at: regName) printString
			at: (self bounds topLeft + (0 @ y))
			font: (LogicalFont familyName: 'Bitmap DejaVu Sans' pointSize: 12)
			color: Color black.
		y := y + 14.
		 ].
	^y
	