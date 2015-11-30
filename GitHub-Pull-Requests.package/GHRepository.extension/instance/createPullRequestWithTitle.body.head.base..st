*GitHub-Pull-Requests-operations
createPullRequestWithTitle: aTitleString body: aString head: toMergeBranchString base: aBranchString

	^ NeoJSONObject
		fromString:
			(self
				post: self pullsBaseUrl
				jsonContent:
					(NeoJSONObject new
						title: aTitleString;
						body: aString;
						head: toMergeBranchString;
						base: aBranchString))