operations
mergeMatchingHeadSha: aSHAString

	^ self mergeWithJSONObject: (NeoJSONObject new
		sha: aSHAString;
		yourself)