operations
mergeWithMessage: aString

	^ self mergeWithJSONObject: (NeoJSONObject new
		commit_message: aString;
		yourself)