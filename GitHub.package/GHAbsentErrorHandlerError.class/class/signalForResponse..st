instance creation
signalForResponse: aResponse

	^ self new
		response: aResponse;
		signal: 'No dedicated error handler found for this error response, see my class comment.'