tests - caching
testConditionalGet

	| user |
	server onRequestRespond: [ :request | | response |
		response := (self json: '{ "name": "Foo" }').
		response headers at: 'ETag' put: 'bar'.
		response ].
	user := github get: 'user'; responseAs: GHUser.
	self assert: user name equals: 'Foo'.
	server onRequestRespond: [ :request |
		ZnResponse notModified ].
	self assert: (github conditionalGet: 'user')