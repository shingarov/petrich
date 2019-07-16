drawing
drawNameOn: aCanvas
	aCanvas
		drawString: instruction nameForInspector
		at: self bounds topLeft 
		font: self nameFont
		color: Color black