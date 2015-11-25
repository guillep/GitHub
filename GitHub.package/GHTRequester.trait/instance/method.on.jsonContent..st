operations
method: aMethodSymbol on: urlPathSegments jsonContent: neoJSONObjectOrString

	^ self rememberUrlDo: [
		self client
			url: urlPathSegments;
			entity: (ZnEntity
				with: neoJSONObjectOrString asString
				type: ZnMimeType applicationJson);
			perform: aMethodSymbol
	]