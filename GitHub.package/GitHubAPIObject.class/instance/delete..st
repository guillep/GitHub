operations
delete: urlPathSegments

	^ self rememberUrlDo: [
		client delete: urlPathSegments
	]