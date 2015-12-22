operations
patch: urlPathSegments jsonContent: neoJSONObjectOrString

	^ self
		method: #PATCH
		on: urlPathSegments
		jsonContent: neoJSONObjectOrString