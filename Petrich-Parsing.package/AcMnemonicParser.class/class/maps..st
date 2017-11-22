instance creation
maps: m
	"TODO -- EXTREMELY BAD.
	I am not sure how to parametrize a parser when productions depend on the parametrization."
	"See also AcMnemonicFormatParser class, which gets the maps from me.
	I, in turn, get filled in #fillMnemonicsFrom: which comes from #fillMapsFrom:,
	which is executed on each ISA parse."
	maps := m.
	^ self new