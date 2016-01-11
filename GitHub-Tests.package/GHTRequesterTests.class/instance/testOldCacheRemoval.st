tests - caching
testOldCacheRemoval

	| user cachedUser |
	server onRequestRespond: [ :request | | response |
		response := (self json: '{ "name": "Foo" }').
		response headers at: 'ETag' put: 'bar'.
		response ].
	user := github get: 'user' cachedResponseAs: GHUser.
	self assert: user name equals: 'Foo'.
	self assert: github ttlCache size equals: 1.
	server onRequestRespond: [ :request | | response |
		response := (request headers includesKey: 'If-None-Match')
			ifTrue: [ self json: '{ "name": "Bar" }' ]
			ifFalse: [ self json: 'null' ].
		response headers at: 'ETag' put: 'foo'.
		response ].
	cachedUser := github get: 'user' cachedResponseAs: GHUser.
	self assert: github ttlCache size equals: 1.
	self assert: user ~= cachedUser.