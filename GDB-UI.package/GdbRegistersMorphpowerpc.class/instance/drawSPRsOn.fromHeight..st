drawing
drawSPRsOn: clippedCanvas fromHeight: y
	| yy |
	yy := y.
	self sprNames  do: [ :spr |
		self drawSPR: spr on: clippedCanvas fromHeight: yy.
		yy := yy + 15.
		].
	self drawCurrentInstructionOn: clippedCanvas fromHeight: yy