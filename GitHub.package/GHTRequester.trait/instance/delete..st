operations
delete: urlPathSegments

	^ self rememberUrlDo: [
		self client delete: urlPathSegments
	]