grammar
start
	^isa end
		==> [ :x | x asOrderedCollection
			inject: OrderedCollection new
			into: [ :soFar :elem | soFar addAll: elem; yourself ]]