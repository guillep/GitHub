tests
testErrorCode: anInteger withMessage: aString shouldRaise: anErrorClass

	self
		testErrorCode: anInteger
		withHeaders: { }
		withMessage: aString
		shouldRaise: anErrorClass