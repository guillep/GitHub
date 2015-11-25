operations
put: urlPathSegments jsonContent: neoJSONObjectOrString

	^ self
		method: #put
		on: urlPathSegments
		jsonContent: neoJSONObjectOrString