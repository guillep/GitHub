caching
conditionalGet: urlPathSegments
	" Perform a conditional GET request using ETags.
	  Returns true if the contents were not modified. "
	self client url: urlPathSegments.
	self prepareConditionalRequest.
	self method: #GET.
	self tearDownConditionalRequest.
	^ self client response isNotModified