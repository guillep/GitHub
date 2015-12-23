operations
setMergeFailureHandlers

	self
		onErrorCode: 405 do: [ :rspns |
			GHPullRequestNotMergeableError signalForResponse: rspns ];
		onErrorCode: 409 do: [ :rspns |
			GHModifiedHeadBranchError signalForResponse: rspns ]
	