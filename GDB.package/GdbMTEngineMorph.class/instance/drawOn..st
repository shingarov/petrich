as yet unclassified
drawOn: aCanvas
	regs := gdb getRegisters.
	aCanvas
		clipBy: self bounds
		during: [:clippedCanvas |
			clippedCanvas
				fillRectangle: self bounds
				color: Color white.	
		self drawCurrentFrameOn: clippedCanvas fromHeight:
		(self drawCurrentBytecodeOn: clippedCanvas fromHeight:
		(self drawCurrentInstructionOn: clippedCanvas fromHeight:
		(self drawVregsOn: clippedCanvas) + 15)) + 15
				].
 