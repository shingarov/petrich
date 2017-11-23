flushing
flushRAM
	| firstUnallocatedAddress |
	firstUnallocatedAddress := self getVRegister: #HEAP.
	leftFinger := 1.
	'Injecting program'
		displayProgressFrom: minAddr to: firstUnallocatedAddress during:
			[ :bar | 	self transmitBelow: firstUnallocatedAddress updating: bar ]
