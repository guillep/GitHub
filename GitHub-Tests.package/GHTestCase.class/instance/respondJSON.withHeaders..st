convenience
respondJSON: aString withHeaders: aDictionaryOrSimilar

	server onRequestRespond: [ :request | | response |
		response := self json: aString.
		response headers addAll: aDictionaryOrSimilar asDictionary.
		response ]