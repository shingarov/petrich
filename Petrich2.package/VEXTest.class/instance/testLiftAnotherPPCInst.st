tests
testLiftAnotherPPCInst
	| irsb |
	irsb := self anotherPPCInst.
	self assert: (irsb statements isKindOf: SequenceableCollection).
	self assert: (irsb statements first isKindOf: VexIMark).
	irsb next.
	self assert: irsb addr equals: 16r104