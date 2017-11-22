as yet unclassified
nativizePushR
	| transfers instructions |
	transfers := OrderedCollection 
		with: 'transfer(gpr(25),+(gpr(25),4))'
		with: 'transfer(memref(+(gpr(25),0)),gpr(2))'.
	instructions := transfers
		inject: OrderedCollection new
		into: [ :instr :transfer | instr addAll: (self pdl emit: transfer); yourself ].
		
	instructions addLast: ((self pdl instructionAt: #lwz) bind: (Dictionary new
		at: 'rt' put: 1;
		at: 'ra' put: 25;
		at: 'd' put: 0;
		yourself
		)) emit.
		
	^instructions 
	
