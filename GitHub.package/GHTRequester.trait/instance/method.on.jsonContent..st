operations
method: aMethodSymbol on: urlPathSegments jsonContent: neoJSONObjectOrString

	^ self
		jsonContent: neoJSONObjectOrString;
		method: aMethodSymbol on: urlPathSegments