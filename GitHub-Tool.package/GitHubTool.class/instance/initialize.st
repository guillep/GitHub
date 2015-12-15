initialization
initialize

	super initialize.
	authenticatedAPI whenChangedDo: [
		repositoryDropDown items: (self authenticatedUser repositories
			collect: [ :each |
				each
					initializeWithClient: authenticatedUser clientCopy;
					jsonReader: authenticatedUser readerCopy;
					yourself.
			]).
	]