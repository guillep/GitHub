tests - caching
testOutdatedETag
	| user |
	self
		respondJSON: '{ "name": "Foo" }'
		withHeaders: { 'ETag' -> 'bar' }.
	user := github get: 'user' cachedResponseAs: GHUser.
	self assert: user name equals: 'Foo'.
	self assert: github ttlCache size equals: 1.
	" Set the time-to-live to a shorter period. "
	github ttlCache timeToLive: 10 milliSeconds.
	10 milliSeconds wait.
	self assert: github outdatedETag.
	self assert: github ttlCache size equals: 0.