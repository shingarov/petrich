grammar
operand
	^id, ($+ asParser, operand) optional
	==> [ :x | x last isNil
		ifTrue: [[ :env | env at: x first ]]
		ifFalse: [[ :env | (env at: x first) + ((x last last) value: env) ]]]