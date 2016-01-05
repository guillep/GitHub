error handling
defaultForbiddenHandle: aResponse
	| remainingRequests |
	remainingRequests := aResponse headers
		at: GHRateLimitExceededError rateLimitRemainingFieldName.
	remainingRequests := remainingRequests asInteger.
	remainingRequests = 0 ifTrue: [
		GHRateLimitExceededError signalForResponse: aResponse ].