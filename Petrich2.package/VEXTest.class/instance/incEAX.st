test mock
incEAX
	| text |
	text := #(16r40) asByteArray.
	^IRSB code: text addr: 16r100 arch: 'IA32'.
