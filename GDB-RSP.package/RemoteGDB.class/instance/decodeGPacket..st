private
decodeGPacket: aStream
	| registerTransfers regs |
	registerTransfers := processorDescription gdb.
	regs := Dictionary new.
	registerTransfers do: [ :rt |
		| nextValue |
		aStream atEnd ifTrue: [ ^regs ].
		nextValue := rt readFrom: aStream.
		regs at: rt regName put: nextValue ].
	^regs

