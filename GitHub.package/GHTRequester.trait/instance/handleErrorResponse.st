error handling
handleErrorResponse
	" Handle errors of the latest response "
	| response errorBlock |
	response := self client response.
	response isError ifFalse: [ ^ self ].
	errorBlock := self errorHandlers
		at: response code
		ifAbsent: [
			GHAbsentErrorHandlerError signalForResponse: response ].
	errorBlock value: response