printing
printOn: aStream 
	aStream
		nextPutAll: 'Instruction format ';
		nextPutAll: name;
		nextPutAll: ' '.
	bitFields printElementsOn: aStream