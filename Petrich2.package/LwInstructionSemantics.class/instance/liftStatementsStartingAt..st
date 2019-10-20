lifting
liftStatementsStartingAt: anAddress
	| statements |
	self addr: anAddress.
	statements := self dsl collect: [ :aString |
		P compute: (self instantiateLWISEM: aString) ].

	^statements 