tests - caching
testGetCachedResponseAs

	| user cachedUser |
	self
		respondJSON: '{ "name": "Foo" }'
		withHeaders: { 'ETag' -> 'bar' }.
	user := github get: 'user' cachedResponseAs: GHUser.
	self assert: user name equals: 'Foo'.
	self assert: github ttlCache size equals: 1.
	server onRequestRespond: [ :request | | response |
		response := (request headers includesKey: 'If-None-Match')
			ifTrue: [ ZnResponse notModified ]
			ifFalse: [ self json: 'null' ].
		response headers at: 'ETag' put: 'bar'.
		response ].
	cachedUser := github get: 'user' cachedResponseAs: GHUser.
	self assert: user == cachedUser.