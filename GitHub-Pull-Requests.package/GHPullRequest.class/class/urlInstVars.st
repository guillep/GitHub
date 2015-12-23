accessing
urlInstVars
	^ (super urlInstVars) , #(#commits_url #diff_url #issue_url #patch_url #review_comment_url #review_comments_url #statuses_url)