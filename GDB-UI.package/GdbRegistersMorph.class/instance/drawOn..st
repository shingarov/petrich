drawing
drawOn: aCanvas
	regs := gdb getRegisters.
	aCanvas
		clipBy: self bounds
		during: [:clippedCanvas |
			clippedCanvas
				fillRectangle: self bounds
				color: Color yellow.	
			self drawRegistersOn: clippedCanvas
		]
 