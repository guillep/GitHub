initialization
initialize

	super initialize.
	authenticatedAPI := nil asValueHolder.
	authenticatedAPI whenChangedDo: [
		self showAuthenticatedMenu ].