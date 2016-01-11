caching
cachedResponseIfAbsent: aBlock
	" Returns the cached response contents stored
	  during a conditional request. Returns nil if
	  the age (time-to-live) has exceeded, or if it
	  has not been cached. "
	| response eTag result |
	response := self client response.
	eTag := response headers at: 'ETag' ifAbsent: [ ^ nil ].
	" Since the Cache objects don't have at:ifAbsent:
	  defined, I used this as a workaround. "
	result := self ttlCache
		at: eTag
		ifAbsentPut: [ nil ].
	result isNil ifTrue: [
		self ttlCache removeKey: eTag ifAbsent: [  ].
		aBlock value ].
	^ result