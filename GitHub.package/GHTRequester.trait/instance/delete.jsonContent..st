operations
delete: urlPathSegments jsonContent: neoJSONObjectOrString

	^ self
		method: #DELETE
		on: urlPathSegments
		jsonContent: neoJSONObjectOrString