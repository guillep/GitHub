caching
get: urlPathSegments cachedResponseAs: aClassOrSchema
	" Performs a conditional request and if there's a match,
	  returns the result from the cache.
	  If the resource was modified, it will cache the new result
	  and return it.
	  If not present, it will perform a non-conditional request. "
	| isNotModified result |
	self client url: urlPathSegments.
	self outdatedETag ifTrue: [
		^ self
			get: urlPathSegments;
			cacheResponseAs: aClassOrSchema ].
	isNotModified := self performConditionalGet.
	" Check if the conditional request returned a match. "
	isNotModified ifFalse: [
		^ self
			cacheResponseAs: aClassOrSchema ].
	result := self cachedResponseIfAbsent: [
		^ self
			get: urlPathSegments;
			cacheResponseAs: aClassOrSchema ].
	^ result