accessing
doesNotUnderstand: aMessage
	"see if it's a setter"
	state @ 'regs'
		at: (self setterMap at: aMessage selector ifAbsent: [ self shouldBeImplemented  ])
		put: aMessage argument 
	