operations
, anotherIRSB
	"Destructively concatenate anotherIRSB to the end of self.
	The object anotherIRSB will be destroyed in the process."
	P eval: self ref, '.extend(', anotherIRSB ref, ')'.
	^self