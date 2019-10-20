tests-powerpc
testLiftOnePPCInst
	| irsb |
	irsb := self onePPCInst.
	self assert: (irsb statements isKindOf: SequenceableCollection).
	self assert: (irsb statements first isKindOf: VexIMark).
	irsb next.
	self assert: irsb addr equals: 16r100