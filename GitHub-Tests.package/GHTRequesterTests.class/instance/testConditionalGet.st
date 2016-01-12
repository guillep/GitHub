tests - caching
testConditionalGet

	| user |
	self
		respondJSON: '{ "name": "Foo" }'
		withHeaders: { 'ETag' -> 'bar' }.
	user := github get: 'user'; responseAs: GHUser.
	self assert: user name equals: 'Foo'.
	self respondNotModified.
	self assert: (github conditionalGet: 'user')