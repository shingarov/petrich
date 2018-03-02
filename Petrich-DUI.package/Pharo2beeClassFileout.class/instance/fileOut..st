file in/out
fileOut: aClassDescription
	| ts |
	ts := '  timeStamp: ''2017-01-01T00:00:01.000-05:00'''.
	stream
		nextPutAll: '!ClassDefinition'; cr;lf;
		nextPutAll: ts; cr;lf;
		nextPutAll: '  author: '''; nextPutAll: (self author); nextPut: $'; cr;lf;
		nextPutAll: '  className: '''; nextPutAll: (aClassDescription name asString); nextPut: $'; cr;lf;
		nextPutAll: '  project: '''; nextPutAll: (self project); nextPut: $'; cr;lf;
		nextPut: $!; cr;lf;
		nextChunkPut: (aClassDescription definition); cr;lf.
	
	"Methods"
	self
		fileOutMethodsOf: aClassDescription;
		fileOutMethodsOf: aClassDescription class