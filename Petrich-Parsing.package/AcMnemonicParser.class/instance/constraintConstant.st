grammar
constraintConstant
	^id, $= asParser, number
	==> [  :x | AcMnemonicConstraintConstant new
			op: (x first);
			c: (x third);
			yourself ]