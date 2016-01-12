tests
testUpdate
	| object |
	self
		respondJSON: '{ "id": 1 }'
		withHeaders: { 'ETag' -> '"foo"' }.
	object := github
		get: server localUrl;
		responseAs: GHObject.
	self assert: object id equals: 1.
	self
		respondJSON: '{ "id": 2 }'
		withHeaders: { 'ETag' -> '"bar"'}.
	object update.
	self assert: object id equals: 2.
	self respondNotModified.
	object update.