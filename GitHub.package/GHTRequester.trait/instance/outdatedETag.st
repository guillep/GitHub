caching
outdatedETag

	| url eTag |
	url := self client request url.
	eTag := self urlToETag at: url ifAbsent: [ ^ true ].
	^ (self ttlCache includesKey: eTag) not