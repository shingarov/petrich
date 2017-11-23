as yet unclassified
drawFrame: fp withAllSendersOn: clippedCanvas fromHeight: y
	| frame yy |
	yy := self drawFrame: fp on: clippedCanvas fromHeight: y.
	frame := MTRemoteStackFrame gdb: gdb pointer: fp.
	frame .
	^y+20
