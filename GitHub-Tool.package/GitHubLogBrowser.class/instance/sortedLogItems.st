private
sortedLogItems
	| items commits |
	commits := self repository commitLogger
		fromShaOrBranch: self branchName;
		log.
	items := GHBrowserLogItem resolveFromCommits: commits.
	items sort: [ :a :b | a commitTime > b commitTime ].
	^ items