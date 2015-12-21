error handling
onErrorCode: anInteger do: aBlock
	" Set the error handler for response code anInteger to aBlock. "
	self errorHandlers at: anInteger put: aBlock