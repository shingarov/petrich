disassembly
disassemble: code
	"Answer the most-descriptive ProcessorInstruction object encoded by @code.
	Most-descriptive means the most-concretized form of writing."
	^code disassembleFor: self