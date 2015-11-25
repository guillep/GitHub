operations
post: urlPathSegments jsonContent: neoJSONObjectOrString

	^ self
		method: #post
		on: urlPathSegments
		jsonContent: neoJSONObjectOrString