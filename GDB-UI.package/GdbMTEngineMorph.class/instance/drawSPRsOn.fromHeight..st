as yet unclassified
drawSPRsOn: clippedCanvas fromHeight: y
	| yy |
	yy := y.
	#('pc' 'lr' 'cr' 'ctr' 'msr' 'xer') do: [ :spr |
		self drawSPR: spr on: clippedCanvas fromHeight: yy.
		yy := yy + 14.
		].
	^yy