accessing
linesOfDisassembly
	^self @'block' @'disassembly' @'insns' collect: [ :insn |
			(insn @'address') printStringHex  , ': ',
			(insn @'mnemonic'), ' ',
			(insn @'op_str')
		]