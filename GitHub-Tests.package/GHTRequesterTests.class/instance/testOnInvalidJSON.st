tests - errors
testOnInvalidJSON

	self
		testErrorCode: 400
		withMessage: 'Invalid JSON'
		shouldRaise: GHBadJSONError