API
read32At: addr
	leftFinger isNil ifTrue: [
		^(((self buffer at: addr - self minAddr + 1) << 24
		bitOr: (self buffer at: addr - self minAddr + 2) << 16)
		bitOr: (self buffer at: addr - self minAddr + 3) << 8)
		bitOr: (self buffer at: addr - self minAddr + 4)
		 ].
	^super read32At: addr