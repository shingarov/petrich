disassembly
decode: anInt
	"Return a copy of the receiver concretized down to be
	consistent with the binary encoding given by anInt.
	Signal UNSAT if this is impossible, -- e.g., if the opcode
	contained in anInt is different from the receiver's opcode.
	
	The most straightforward scenario is when the receiver
	is an instruction declaration (i.e. none of the operands
	are known) and the argument is concrete (non-symbolic),
	resulting in a fully-grounded instruction; but this does
	not *necessarily* have to be the only possible scenario:
	some operands could be known already, and anInt could
	contain some unknown bits.
	
	NB: The solver returns a MODEL, not the Most General
	UNIFICATION, so if anInt is symbolic, this method may
	return a result more specific than what necessarily
	follows from what's known.
	
	NB2: anInt is allowed to be an Integer instead of bit vector."
	
	| s model |
	s := SimState now solver.
	s add: binaryEncoding = anInt.
	s isSatisfiable ifFalse: [ Unsat signal ].
	model := s eval: binaryEncoding.
	"if anInt is an Integer, the solver can be overly zealous
	in normalization and return an Integer; well we want an Int"
	model isNumber ifTrue: [
		model := IntValue value: model length: binaryEncoding length
	].
	^self copyWithBinary: model