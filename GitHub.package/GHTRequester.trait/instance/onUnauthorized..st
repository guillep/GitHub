error handling
onUnauthorized: aBlock

	self onErrorCode: 401 do: aBlock