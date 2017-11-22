drawing
drawStump: i on: aCanvas
	| x |
	x := self stumpX: i.
	aCanvas
		line: x @ (self bitBox bottom-1)
		to: x  @ (self bitBox bottom-(self stumpHeight: i))
		width: 1
		color: (Color red)