operations
method: aMethodSymbol
	| url eTag |
	url := self client request url.
	self client
		method: aMethodSymbol;
		execute.
	eTag := self client response headers
		at: 'ETag'
		ifAbsent: [ ^ self ].
	self urlToETag at: url put: eTag.