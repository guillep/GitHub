operations
get: urlPathSegments

	^ self rememberUrlDo: [
		self client get: urlPathSegments
	]