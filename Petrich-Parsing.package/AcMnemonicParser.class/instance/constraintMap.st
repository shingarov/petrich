grammar
constraintMap
	^id, $= asParser, id, '.map_to("' asParser, id, '")' asParser 
	==> [  :x | 
		| map |
		map := self class maps at: x third.
		AcMnemonicConstraintConstant  new
			op: (x first);
			c: (map keyAtValue: x fifth ifAbsent: [ self error ]);
			yourself ]