examples
singleStepNFibFor: v numTimes: n on: aStream
	"self new singleStepNFibFor: 2 numTimes: 32 on: Transcript"
	| memory p state newState |
	memory := Bitmap new: 1024 * 2 withAll: self processor nopOpcode.
	memory replaceFrom: 1 to: self nfib size with: self nfib asWordArray startingAt: 1.
	(p := self processor)
		r0: n;
		lr: memory size * 2; "return address"
		pc: 0;
		sp: (memory size * 4) - 16.
	p printRegistersOn: aStream.
	state := p registerState.
	aStream cr; flush.
	n timesRepeat:
		[| first |
		 aStream nextPutAll: (p disassembleNextInstructionIn: memory); space.
		 p singleStepIn: memory readExecuteOnlyBelow: memory size / 2.
		 newState := p registerState.
		 first := true.
		 state doWithIndex:
			[:rv :i| | nv |
			rv ~= (nv := newState at: i) ifTrue:
				[first ifTrue: [aStream crtab: 2. first := false].
				 aStream nextPutAll: (p registerStateSetters at: i); space; print: rv; nextPutAll: ' -> '; print: nv; space]].
		 aStream cr; flush.
		 state := newState].
	^p r0