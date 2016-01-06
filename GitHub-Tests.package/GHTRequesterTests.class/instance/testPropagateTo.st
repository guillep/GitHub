tests
testPropagateTo
	" Assert that the GitHub instance is propagated to all requesters,
	  both to requesters in Collections or just singular requesters. "
	| result |
	server onRequestRespond: [ :request |
		(ZnResponse ok: (ZnStringEntity json: '{ "login": "JohnDoe" }'))
			setLocation: request url asString; 
			yourself ].
	result := github user.
	self assert: result github isNotNil.
	server onRequestRespond: [ :request |
		(ZnResponse ok: (ZnStringEntity json: '[ { "login": "JohnDoe" }, { "login": "JaneDoe" } ]'))
			setLocation: request url asString; 
			yourself ].
	github
		putMapping: [ :mapping | mapping listOfElementSchema: GHUser ]
		ifAbsentAt: #ArrayOfUsers.
	result := github
		get: 'anythingWillDo';
		responseAs: #ArrayOfUsers.
	self assert: ((result collect: #github) allSatisfy: #isNotNil).