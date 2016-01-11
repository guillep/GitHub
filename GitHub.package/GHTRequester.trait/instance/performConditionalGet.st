caching
performConditionalGet
	" Perform a conditional GET request using ETags.
	  Returns true if the contents were not modified. "
	self prepareConditionalRequest.
	self method: #GET.
	self tearDownConditionalRequest.
	^ self client response isNotModified