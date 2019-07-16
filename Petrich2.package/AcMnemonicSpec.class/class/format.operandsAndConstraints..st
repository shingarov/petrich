instance creation
format: aMnemonicFormat operandsAndConstraints: anArray
	^self new
		format: aMnemonicFormat ;
		operands: (anArray reject: [ :op | op isKindOf: AcMnemonicConstraint ]);
		constraints: (anArray select: [ :op | op isKindOf: AcMnemonicConstraint ]);
		yourself