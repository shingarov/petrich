file in/out
fileOutMethod: sel ofClass: aClassDescription
	| ts sourceCode |
	ts := '  timeStamp: ''2017-01-01T00:00:01.000-05:00'''.
	stream
		nextPutAll: '!MethodDefinition'; cr;lf;
		nextPutAll: ts; cr;lf;
		nextPutAll: '  author: '''; nextPutAll: (self author); nextPut: $'; cr;lf;
		nextPutAll: '  className: '''; nextPutAll: (aClassDescription name asString); nextPut: $'; cr;lf;
		nextPutAll: '  selector: '; nextPutAll: (sel printString); cr;lf;
		nextPutAll: '  category: '; nextPutAll: ((aClassDescription organization categoryOfElement: sel) printString); cr;lf;
		nextPutAll: '  project: '''; nextPutAll: (self project); nextPut: $'; cr;lf;
		nextPut: $!; cr;lf.
	sourceCode := (aClassDescription >> sel) sourceCode.
	self stream nextChunkPut: sourceCode; cr;lf

