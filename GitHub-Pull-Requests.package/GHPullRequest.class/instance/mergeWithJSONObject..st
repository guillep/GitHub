operations
mergeWithJSONObject: aJSONObjectOrString
	" Perform a merge, and return the resulting sha. "
	| json |
	self setMergeFailureHandlers.
	aJSONObjectOrString ifNotNil: [
		self jsonContent: aJSONObjectOrString ].
	self method: #PUT on: self mergeUrl.
	self handleErrorResponse.
	json := NeoJSONObject fromString: self client contents.
	^ json at: 'sha'