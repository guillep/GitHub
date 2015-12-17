error handling
defaultErrorHandlers
	^ {
		400 -> [ :rspns |
			GHBadJSONError signalForResponse: rspns ].
		401 -> [ :rspns |
			GHBadCredentialsError signalForResponse: rspns ].
		403 -> [ :rspns |
			self defaultForbiddenHandle: rspns ].
		404 -> [ :rspns |
			GHResourceNotFoundError signalForResponse: rspns ].
		422 -> [ :rspns |
			GHInvalidRequestError signalForResponse: rspns ]
	} asDictionary