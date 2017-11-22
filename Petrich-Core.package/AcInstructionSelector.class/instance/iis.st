accessing
iis
	iis isNil ifTrue: [ iis := IdiomaticInstructionSelector pdl: self ].
	^ iis