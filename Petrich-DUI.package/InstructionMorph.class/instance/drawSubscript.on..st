drawing
drawSubscript: i on: aCanvas
	| subscript centerOfCell |
	subscript := (32 - i) asString.
	centerOfCell := (self stumpX: i) - (self bounds width - 2 // 32  // 2).
	self drawStump: i on: aCanvas. 
	aCanvas
		drawString: subscript
		at: (centerOfCell - ((self bitNumberFont widthOfString: subscript)//2)) @ self bitBox bottom
		font: self bitNumberFont
		color: Color blue