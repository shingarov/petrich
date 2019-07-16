disassembly
disassemble
	| variants |
	variants := mnemonics collect: [ :mnem |
		mnem disassembleEnv: 1 ].
	variants := variants reject: [ :v | v isNil ].
	variants := variants sorted: [ :a :b | a value > b value ].
	^variants first key