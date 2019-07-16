logic
printLogicOn: aStream
	trees do: [ :semTree | semTree printLogicOn: aStream. aStream lf ]