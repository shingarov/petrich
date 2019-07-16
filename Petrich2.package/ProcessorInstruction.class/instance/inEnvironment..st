emitting
inEnvironment: env
	"Answer a ProcessorInstruction where the operands are bound according to env.
	It is not necessary to define values for ALL operands; if some operands are
	left unspecified, those bits in the emitted binary will be symbolic.
	NB: unlike #decode: which returns a model, this method's answer is the most general."
	^self copyWithBinary: (binaryEncoding inEnvironment: env)