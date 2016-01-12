tests
testIsOutdated
	| object |
	self
		respondJSON: '{ "id": 1 }'
		withHeaders: { 'ETag' -> '"foo"' }.
	object := github
		get: server localUrl;
		responseAs: GHObject.
	self respondNotModified.
	self assert: object isOutdated not.
	self
		respondJSON: '{ "id": 2 }'
		withHeaders: { 'ETag' -> '"bar"' }.
	self assert: object isOutdated.
	server onRequestRespond: [ :request |
		(request headers at: 'If-None-Match') = '"bar"'
			ifTrue: [ZnResponse notModified]
			ifFalse: [self json: '{ "id": 2 }'] ].
	self assert: object isOutdated