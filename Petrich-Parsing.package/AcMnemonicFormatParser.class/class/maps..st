instance creation
maps: m
	"The argument here is the final result of parsing
	the ac_asm_map statements in *_isa.ac.
	"
	"TODO -- EXTREMELY BAD.
	I am not sure how to parametrize a parser when productions depend on the parametrization."
	maps := m.
	^ self new