operations
method: aMethodSymbol on: urlPathSegments

	self client url: urlPathSegments.
	^ self
		method: aMethodSymbol