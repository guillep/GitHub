initialization
initialize

	super initialize.
	authenticatedAPI whenChangedDo: [
		repositoryDropDown items: (self authenticatedUser repositories).
	]