instance creation
signalForResponse: aResponse
	| json |
	json := NeoJSONObject fromString: aResponse contents.
	^ self new
		signal: json message;
		yourself