disassembly
disassemble
	| variants |
	variants := mnemonics collect: [ :mnem |
		mnem disassembleEnv: externalBindings ].
	variants := variants reject: [ :v | v isNil ].
	variants := variants sorted: [ :a :b | a value > b value ].
	^variants first key