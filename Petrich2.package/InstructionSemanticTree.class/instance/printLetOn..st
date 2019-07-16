logic
printLetOn: aStream
	let keysAndValuesDo: [ :k :v |
		aStream
			nextPutAll: '  Op';
			nextPutAll: (k printString);
			nextPutAll: ' = '.
		v putOn: aStream.
		aStream
			nextPut: $,;
			cr ]