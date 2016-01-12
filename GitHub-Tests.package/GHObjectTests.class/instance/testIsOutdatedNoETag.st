tests
testIsOutdatedNoETag
	| object |
	self
		respondJSON: '{ "id": 1 }'.
	object := github
		get: server localUrl;
		responseAs: GHObject.
	self assert: object isOutdated.
	self assert: object isOutdated.