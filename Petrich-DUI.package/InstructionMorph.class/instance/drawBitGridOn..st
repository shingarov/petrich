drawing
drawBitGridOn: aCanvas
	aCanvas
		frameAndFillRectangle: self bitBox 
		fillColor: Color white
		borderWidth: 2
		borderColor: Color black.
	
	
	1 to: 31 do: [ :i |
		| x subscript centerOfCell |
		x := self stumpX: i.
		subscript := (32 - i) asString.
		centerOfCell := x - (self bounds width - 2 // 32  // 2).
		self drawStump: i on: aCanvas. 
		aCanvas
			drawString: subscript
			at: (centerOfCell - ((self bitNumberFont widthOfString: subscript)//2)) @ self bitBox bottom
			font: self bitNumberFont
			color: Color blue]