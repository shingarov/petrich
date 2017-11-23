as yet unclassified
drawOn: aCanvas
	regs := gdb getRegisters.
	aCanvas
		clipBy: self bounds
		during: [:clippedCanvas |
			clippedCanvas
				fillRectangle: self bounds
				color: Color yellow.	
		self drawSPRsOn: clippedCanvas fromHeight:
		(self drawGPRsOn: clippedCanvas) + 15
				].
 