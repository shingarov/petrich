surgery
inspectionPoint
self halt.
"	selectorOop := self getRegisters at: 'r7'.
	primSaySelector := exe externalReferences at: #Symbol_primSay.
	selectorOop = primSaySelector ifTrue: [ 
		siOOP := self getVRegister: #R.
		self pharoObjectForOop: siOOP.
		self halt.
		siMD := self mdFor: siOOP.
		superMD := (MTRemoteMethodDictionary gdb: self pointer: siMD) superMd.
		superSuperMD := superMD superMd.
		 ]."
	"anotherWay := self currentBytecode selector value."
	"gdb s"