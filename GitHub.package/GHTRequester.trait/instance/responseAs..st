response
responseAs: aClassOrSchema
	" Get the parsed JSON as an instance of aClassOrSchema, which knows how to map the JSON
	to its own data structure. "

	| result |
	" Close the current stream. "
	self jsonReader ifNotNil: [ self jsonReader close ].
	self jsonReader on: self client contents readStream.
	result := self jsonReader nextAs: aClassOrSchema.
	self propagateClientAndReaderTo: result.
	^ result
