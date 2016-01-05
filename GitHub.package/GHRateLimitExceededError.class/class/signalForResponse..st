instance creation
signalForResponse: aResponse
	| headers json |
	headers := aResponse headers.
	json := NeoJSONObject fromString: aResponse contents.
	^ self new
		limit: (headers at: self rateLimitLimitFieldName) asInteger;
		windowResetDateAndTime: (headers at: self rateLimitResetFieldName) asInteger;
		signal: json message;
		yourself