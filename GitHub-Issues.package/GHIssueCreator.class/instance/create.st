executing
create
	| jsonParameter |
	jsonParameter := NeoJSONWriter toString: parameters.
	^ repo
		post: repo issuesBaseUrl jsonContent: jsonParameter;
		responseAs: GHIssue