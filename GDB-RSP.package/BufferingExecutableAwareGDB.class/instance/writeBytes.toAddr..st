API
writeBytes: aByteArray toAddr: addr
	| start stop |
	leftFinger isNil ifTrue: [
		start := addr - self minAddr + 1.
		stop := start + aByteArray size - 1.
		^self buffer replaceFrom: start to: stop with: aByteArray startingAt: 1 ].
	^super writeBytes: aByteArray toAddr: addr