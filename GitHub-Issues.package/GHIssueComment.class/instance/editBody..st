operations
editBody: aString

	^ self
		patch: self url jsonContent: (NeoJSONObject new
			body: aString;
			yourself);
		responseAs: self class