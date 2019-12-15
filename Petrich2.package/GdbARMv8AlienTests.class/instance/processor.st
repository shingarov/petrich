accessing
processor
	processor ifNil:
		[processor := GdbARMv8Alien new].
	^processor