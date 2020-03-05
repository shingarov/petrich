GT
allBackers
	| backerListVar len backers |
	backerListVar := P evalAndAssign:  '[ (start, backer) for start, backer in ', self backers ref, ']'.
	len := P compute: 'len(', backerListVar ref , ')'.
	backers := Dictionary new.
	0 to: len - 1 do: [ :j |
		| startAddr bytes |
		startAddr := P compute: backerListVar ref, '[', j printString, '][0]'.
		bytes     := "P compute: backerListVar ref, '[', j printString, '][1]'." 'FIXME: bytearray may be too long'.
		backers at: startAddr put: bytes ].
	^backers
