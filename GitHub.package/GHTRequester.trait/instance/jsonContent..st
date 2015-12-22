operations
jsonContent: neoJSONObjectOrString
	" Set the JSON parameter. "
	self client
		entity: (ZnEntity
			with: neoJSONObjectOrString asParameterString
			type: ZnMimeType applicationJson)