grammar
asmMap
	"An 'asmmapdec' of the form,
	
	AC_ASM_MAP id LBRACE mapbodylist RBRACE
	
	The asmmapdec object in Smalltalk associates the id to the
	Dictionary representing the mapbodylist.
	Return an array with an association from 'ac_map'
	to the asmmapdec, so that as a final step all maps are
	combined into one dictionary (see #)."
	^'ac_asm_map' asParser trim,
	id,
	#space asParser star,
	${ asParser,
	asmMapBody trim plus,
	$} asParser
	==> [ :x |
		| mapId mapbodylist constructedMapbodylist |
		mapId := x second.
		mapbodylist := x fifth.
		constructedMapbodylist := AcIsaParser constructAsmMap: mapbodylist.
		Array with: 'ac_map' -> (mapId -> constructedMapbodylist) ]
	