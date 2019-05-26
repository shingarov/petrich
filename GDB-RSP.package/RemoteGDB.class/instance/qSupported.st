general query commands
qSupported
	supported := self q: 'qSupported:swbreak+'.
	supported isEmpty ifTrue: [ ^self error: 'qSupported returned empty string' ].
	supported := $; split: supported