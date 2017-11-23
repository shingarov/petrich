API
activateCM: cm
	| jmpTarget |
	jmpTarget := cm codeRef address.
	regBase
		setRegister: 'ctr' to: jmpTarget; "we should do something about it"
		setVRegister: #X to: cm pointer.
	^jmpTarget