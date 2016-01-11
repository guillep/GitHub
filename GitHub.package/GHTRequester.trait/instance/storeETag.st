private
storeETag
	| eTag url |
	url := self client request url.
	eTag := self client response headers at: 'ETag' ifAbsent: [ ^ self ].
	self urlToETag
		at: url
		ifPresent: [ :oldETag | 
			oldETag ~= eTag
				ifTrue: [ self ttlCache removeKey: oldETag ifAbsent: [ ] ]
				ifFalse: [ ^ self ] ].
	self urlToETag at: url put: eTag