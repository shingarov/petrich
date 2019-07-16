grammar
functor
	^ (#word asParser /
	(PPPredicateObjectParser chars: '.?!;:#$%&*+-/<>=@[]\^_{}|~' message:'functor'))
	star flatten