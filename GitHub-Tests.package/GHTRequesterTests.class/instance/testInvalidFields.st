tests
testInvalidFields

	self
		testErrorCode: 422
		withMessage: 'Invalid parameters'
		shouldRaise: GHInvalidRequestError