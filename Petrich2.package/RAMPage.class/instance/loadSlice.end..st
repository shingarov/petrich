as yet unclassified
loadSlice: start end: end
	"Answer the MemoryObjects overlapping with the provided slice.
	"
	^self load_slice: nil "state" start: start end: end