caching
cacheResponseAs: aClassOrSchema
	" Cache the response's parsed contents by its ETag. "
	| response eTag result |
	response := self client response.
	result := self responseAs: aClassOrSchema.
	eTag := response headers
		at: 'ETag' ifAbsent: [ ^ result ].
	^ self ttlCache at: eTag put: result