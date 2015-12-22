operations
post: urlPathSegments jsonContent: neoJSONObjectOrString

	^ self
		method: #POST
		on: urlPathSegments
		jsonContent: neoJSONObjectOrString