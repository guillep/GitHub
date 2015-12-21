error handling
onInvalidJSON: aBlock
	" One should not have to override this, given that the API
	  implementation is correct. That is, unless someone does
	  their own PUT/PATCH/DELETE/etc. requests. "
	self onErrorCode: 400 do: aBlock