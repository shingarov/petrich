as yet unclassified
drawCurrentFrameOn: clippedCanvas fromHeight: y
	| fp  |
	fp := gdb getVRegister: #FP.
	self drawFrame: fp withAllSendersOn: clippedCanvas fromHeight: y
