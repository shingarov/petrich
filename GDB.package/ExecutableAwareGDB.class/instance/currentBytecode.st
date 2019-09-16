representation
currentBytecode
	| def vPC |
	def := self exe whereAmI.
	vPC := self getVRegister: #VPC.
	^def ir instructions at: vPC+1