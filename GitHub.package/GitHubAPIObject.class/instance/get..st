operations
get: urlPathSegments

	^ self rememberUrlDo: [
		client get: urlPathSegments
	]