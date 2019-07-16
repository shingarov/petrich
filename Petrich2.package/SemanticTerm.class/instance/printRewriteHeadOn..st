logic
printRewriteHeadOn: aStream
	aStream nextPutAll: functor; nextPut: $(.
	args printUsing: #printRewriteHeadOn: on: aStream.
	aStream nextPut: $).