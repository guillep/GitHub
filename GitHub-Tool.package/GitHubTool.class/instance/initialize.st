initialization
initialize

	super initialize.
	authenticatedAPI := nil asValueHolder.
	authenticatedAPI whenChangedDo: [
		self showAuthenticatedMenu.
		repositoryDropDown items: (self authenticatedUser repositories
			select: [ :each | each language = 'Smalltalk' ]
			thenCollect: [ :each |
				each
					initializeWithClient: authenticatedUser clientCopy;
					jsonReader: authenticatedUser readerCopy;
					yourself.
			]).
	]