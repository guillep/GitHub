tests
testUpdate
	| object requestMade |
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

	" Ensure that a request is made when server responds with NotModified. "
	requestMade := false.
	ZnLogEvent announcer when: ZnRequestReadEvent do: [ requestMade := true ].
	self respondNotModified.
	object update.
	self assert: requestMade.