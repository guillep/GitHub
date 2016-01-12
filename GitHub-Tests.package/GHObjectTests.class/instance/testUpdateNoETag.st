tests
testUpdateNoETag
	| object |
	self
		respondJSON: '{ "id": 1 }'.
	object := github
		get: server localUrl;
		responseAs: GHObject.
	self assert: object id equals: 1.
	self assert: object isOutdated.
	self
		respondJSON: '{ "id": 1 }'
		withHeaders: { 'ETag' -> 'foo' }.
	object update.
	self respondNotModified.
	self assert: object isOutdated not.