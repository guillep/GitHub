tests
testIsOutdated
	| object |
	self
		respondJSON: '{ "id": 1, "url": "http://localhost:1724/"}'
		withHeaders: { 'ETag' -> '"foo"' }.
	object := github
		get: server localUrl;
		responseAs: GHObject.
	self respondNotModified.
	self assert: object isOutdated not.
	self
		respondJSON: '{ "id": 2, "url": "http://localhost:1724/"}'
		withHeaders: { 'ETag' -> '"bar"' }.
	self assert: object isOutdated