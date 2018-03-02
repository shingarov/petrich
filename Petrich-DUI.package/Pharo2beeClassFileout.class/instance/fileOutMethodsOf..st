file in/out
fileOutMethodsOf: aClassDescription
	aClassDescription organization allMethodSelectors do: [ :sel | self fileOutMethod: sel ofClass: aClassDescription ]