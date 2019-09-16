API
messageSendSelector: selectorSymbol
	| receiver  mdRef md  cm |
	receiver := regBase getVRegister: #R.
	mdRef := ram mdFor: receiver.
	md := MTRemoteMethodDictionary gdb: ram pointer: mdRef.
	cm := md lookupSelector: selectorSymbol.
	^self activateCM: cm