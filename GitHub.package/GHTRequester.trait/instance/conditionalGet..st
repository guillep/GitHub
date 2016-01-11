caching
conditionalGet: urlPathSegments
	" Perform a conditional GET request using ETags on the given URL.
	  Returns true if the contents were not modified. "
	self client url: urlPathSegments.
	^ self performConditionalGet