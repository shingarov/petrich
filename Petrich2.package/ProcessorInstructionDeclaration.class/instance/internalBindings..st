parser access for construction
internalBindings: aDict
	internalBindings := aDict.
	"at this point in the creation sequence,
	we know enough to instantiate a binary encoding"
	self initializeBinaryEncoding 