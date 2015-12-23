operations
mergeWithMessage: aString matchingHeadSha: aSHAString

	^ self mergeWithJSONObject: (NeoJSONObject new
		commit_message: aString;
		sha: aSHAString;
		yourself)