drawing
drawCost: anInteger on: aCanvas y: y hasDelaySlot: aBoolean
	| costString font width rect |

	rect := self bitBox right - 24 @ (y+2) extent: 23@19.
	aCanvas	
		frameAndFillRectangle: rect
		fillColor: (aBoolean ifTrue: [Color blue] ifFalse: [Color black])
		borderWidth: 0
		borderColor: Color black.

	costString := anInteger asString.
	font := self costFont.
	width := font widthOfString: costString.
	aCanvas 
		drawString: costString 
		at: (rect left + rect right - width // 2) @ (y+4)
		font: font 
		color: Color white
