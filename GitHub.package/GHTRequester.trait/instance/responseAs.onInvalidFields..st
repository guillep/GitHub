response
responseAs: aClassOrSchema onInvalidFields: aBlockAcceptingResponse
	" Get the latest response, using the given block to handle the error
	  if the request was invalid. This resets the old globally set error
	  handler afterwards. "

	| oldHandler |
	oldHandler := self onInvalidFields.
	self onInvalidFields: aBlockAcceptingResponse.
	^ [ self responseAs: aClassOrSchema ]
		ensure: [ self onInvalidFields: oldHandler ]