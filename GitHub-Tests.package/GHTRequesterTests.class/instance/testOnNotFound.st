tests
testOnNotFound

	self
		testErrorCode: 404
		withMessage: 'Not Found'
		shouldRaise: GHResourceNotFoundError