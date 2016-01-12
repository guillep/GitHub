tests - errors
testBadCredentials

	self
		testErrorCode: 401
		withMessage: 'Bad credentials'
		shouldRaise: GHBadCredentialsError