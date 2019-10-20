substitution
substituteValue: key
	^([instruction fieldValue: key]
		on: KeyNotFound
		do: [self specialValue: key]) representSmalltalkInPython