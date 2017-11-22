comparing
= anotherInstruction
	self == anotherInstruction ifTrue: [^ true].
	^self emit = anotherInstruction emit
	
