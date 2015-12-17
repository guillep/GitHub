error handling
onErrorCode: anInteger do: aBlock

	self errorHandlers at: anInteger put: aBlock