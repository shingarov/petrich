grammar
decimalNumber
	^#digit asParser plus flatten ==> [ :x | x asInteger ]