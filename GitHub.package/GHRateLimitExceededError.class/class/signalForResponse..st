instance creation
signalForResponse: aResponse
	| headers json |
	headers := aResponse headers.
	json := NeoJSONObject fromString: aResponse contents.
	^ self new
		limit: (headers at: self rateLimitLimitFieldName);
		windowResetDateAndTime: (headers at: self rateLimitResetFieldName);
		signal: json message;
		yourself