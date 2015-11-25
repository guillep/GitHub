operations
patch: urlPathSegments jsonContent: neoJSONObjectOrString

	^ self
		method: #patch
		on: urlPathSegments
		jsonContent: neoJSONObjectOrString