drawing
drawOn: aCanvas
	aCanvas
		clipBy: self bounds
		during: [:clippedCanvas |
			clippedCanvas
				fillRectangle: self bounds
				color: Color white.	
		self
			drawNameOn: clippedCanvas ;
			drawBitGridOn: clippedCanvas ;
			drawFieldsOn: clippedCanvas ;
			drawSemanticsOn: clippedCanvas 

				].
 