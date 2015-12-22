operations
method: aMethodSymbol on: urlPathSegments

	^ self rememberUrlDo: [
		self client
			url: urlPathSegments;
			method: aMethodSymbol;
			execute
	]