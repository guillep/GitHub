operations
get: urlPathSegments decodedAs: aClassOrSchema
	" Get the parsed JSON as an instance of aClassOrSchema, which knows how to map the JSON
	to its own data structure. "

	jsonReader ifNotNil: [ jsonReader close ]. " Close the current stream. "
	jsonReader on: (self get: urlPathSegments) readStream.
	^ jsonReader nextAs: aClassOrSchema