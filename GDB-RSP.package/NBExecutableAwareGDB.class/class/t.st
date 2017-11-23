NB interface to SHM
t
"	| b |
	b := ByteArray with: 1 with: 2 with: 3 with: 4.
	NativeBoost forCurrentPlatform
		memCopy: b
		to: (self shmaddr: 1024*1024) + 0
		size: 4.
"
^NativeBoost forCurrentPlatform ulongAt: ((self shmaddr: 1024) + 0) value
