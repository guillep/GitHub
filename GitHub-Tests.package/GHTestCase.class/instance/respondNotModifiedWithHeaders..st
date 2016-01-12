convenience
respondNotModifiedWithHeaders: aDictionaryOrSimilar

	server onRequestRespond: [ :request | | response |
		response := ZnResponse notModified.
		response headers addAll: aDictionaryOrSimilar asDictionary.
		response ]