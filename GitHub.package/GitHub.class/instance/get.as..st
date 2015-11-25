initialization
get: urlPathSegments as: aClass

	^ NeoJSONReader fromString: (self get: urlPathSegments) as: aClass