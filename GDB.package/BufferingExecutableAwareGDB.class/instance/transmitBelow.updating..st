flushing
transmitBelow: firstUnallocatedAddress updating: aProgressBar
| bytes thisChunk |
	bytes := firstUnallocatedAddress - self minAddr.
	bytes = 0 ifTrue: [ buffer := nil. ^self ].
	bytes > self chunkSize ifTrue: [ bytes := self chunkSize ].

thisChunk := buffer copyFrom: leftFinger to: leftFinger + bytes - 1.
aProgressBar value: minAddr.
self writeBytes: thisChunk toAddr: minAddr.
minAddr := minAddr + bytes.
leftFinger := leftFinger + bytes.
self transmitBelow: firstUnallocatedAddress updating: aProgressBar 