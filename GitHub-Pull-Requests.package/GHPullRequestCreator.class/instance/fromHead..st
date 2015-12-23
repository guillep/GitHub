accessing parameters
fromHead: aString
	" aString can represent a branch on a fork, using the syntax username:branch "
	parameters at: 'head' put: aString