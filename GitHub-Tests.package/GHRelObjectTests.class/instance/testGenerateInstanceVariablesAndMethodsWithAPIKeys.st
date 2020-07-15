tests
testGenerateInstanceVariablesAndMethodsWithAPIKeys
	| newClass |
	newClass := classFactory newSubclassOf: GHRelObject
		instanceVariableNames: ''
		classVariableNames: ''.

	newClass generateInstanceVariablesAndMethodsWithAPIKeys: #(_links additions base changed_files commits commits_url deletions diff_url head issue_url merge_commit_sha mergeable mergeable_state merged merged_at merged_by patch_url review_comment_url review_comments review_comments_url statuses_url).
	
	self assert: newClass dateAndTimeInstVars equals:  #(merged_at).
	self assert: newClass urlInstVars equals:  #(#commits_url #diff_url #issue_url #patch_url #review_comment_url #review_comments_url #statuses_url).
	
	self assert: (newClass canUnderstand: #mergedAt).
	self assert: (newClass canUnderstand: #commitsUrl).