grammar
xColumnNumber
	"Instruction encoding fields like %opcode:6.
	NB: because the parser records the parsing result in associations
	such as '%opcode' -> 6, the 'signed' tag is conveyed via a horrible
	hack: by negating the width.  That is, if the width is negative then
	the operand is to be treated as signed."
	^(percentId / number), $: asParser, number, ':s' asParser optional
	==> [ :x |
		| fieldName width signed |
		fieldName := x first.
		width := x third.
		signed := x fourth.
		signed isNil ifFalse: [ width := width negated ].
		fieldName -> width ]