tests - errors
testAbsentErrorHandlerError

	server onRequestRespond: [ :request |
		ZnResponse serverError: 'Unhandled Server Error' ].
	self
		should: [ github user ]
		raise: GHAbsentErrorHandlerError
		whoseDescriptionIncludes: 'No dedicated error handler found for this error response, see my class comment.'
		description: 'Failure: should have thrown GHNoErrorHandlerFoundError'