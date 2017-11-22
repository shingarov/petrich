instance creation
callFor: id
	^self new
		id: id;
		isReturn: false;
		yourself