tests
testRateLimitExceeded
	| now |
	now := DateAndTime now rounded.
	self
		testErrorCode: 403
		withHeaders: {
			'X-RateLimit-Remaining' -> '0'.
			'X-RateLimit-Limit' -> '5'.
			'X-RateLimit-Reset' -> now asUnixTime asString
			}
		withMessage: now asString
		shouldRaise: GHRateLimitExceededError