accessing parameters
sortedOn: aString
	" aString can be 'created', 'updated' or 'comments' "
	parameters at: 'sort' put: aString