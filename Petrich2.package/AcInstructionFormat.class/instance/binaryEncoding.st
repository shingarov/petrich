instruction encoding
binaryEncoding
	"Answer the bit vector representing this format's binary encoding.
	Most bits in this vector will be variable, so the answer is an
	algebraic expression over field values."
	^self bitFields
		inject: (IntValue value: 0 length: 0)
		into: [ :soFar :f | soFar, (f key asBitVector: f value abs) ]