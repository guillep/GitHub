operations
get: urlPathSegments decodedAs: aClassOrSchema
	" Get the parsed JSON as an instance of aClassOrSchema, which knows how to map the JSON
	to its own data structure. "

	self jsonReader ifNotNil: [ self jsonReader close ]. " Close the current stream. "
	self jsonReader on: (self get: urlPathSegments) readStream.
	^ self jsonReader nextAs: aClassOrSchema