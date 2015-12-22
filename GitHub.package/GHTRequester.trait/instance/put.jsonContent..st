operations
put: urlPathSegments jsonContent: neoJSONObjectOrString

	^ self
		method: #PUT
		on: urlPathSegments
		jsonContent: neoJSONObjectOrString