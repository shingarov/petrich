drawing
drawFieldsOn: aCanvas
	| i |
	i := 0.
	instruction format bitFields do: [ :field |
		| left right |
		left := self stumpX: i.
		i := i + field value abs.
		right := self stumpX: i.
		self
			drawFieldSeparator: i on: aCanvas; 
			drawField: field key on: aCanvas left: left right: right. 
		 ]