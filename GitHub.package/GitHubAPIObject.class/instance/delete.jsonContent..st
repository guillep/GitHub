operations
delete: urlPathSegments jsonContent: neoJSONObjectOrString

	^ self
		method: #delete
		on: urlPathSegments
		jsonContent: neoJSONObjectOrString