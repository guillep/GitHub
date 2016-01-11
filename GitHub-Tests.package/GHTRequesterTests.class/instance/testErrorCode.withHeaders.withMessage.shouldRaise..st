tests - errors
testErrorCode: anInteger withHeaders: aDictionaryOrSimilar withMessage: aString shouldRaise: anErrorClass

	server onRequestRespond: [ :request | | response |
		response := (ZnResponse statusCode: anInteger)
			setLocation: request url asString;
			entity: (ZnStringEntity json: '{ "message": "', aString , '" }')
			yourself.
		response headers addAll: aDictionaryOrSimilar asDictionary.
		response ].
	self
		should: [ github user ]
		raise: anErrorClass
		whoseDescriptionIncludes: aString
		description: 'Failure: JSON message was not parsed and stored in description.'