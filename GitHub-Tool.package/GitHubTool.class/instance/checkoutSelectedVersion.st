actions
checkoutSelectedVersion

	| repo selected |
	selected := logBrowser log selectedItem content.
	repo := GHLocalRepository
		getOrCreateRepositoryForRemote: logBrowser repository.
	(logBrowser log roots indexOf: selected) = 1
		ifTrue: [
			self commitButton enable.
			repo checkoutBranch: branchesDropDown selectedItem
		]
		ifFalse: [
			self commitButton disable.
			repo checkoutCommit: selected
		].
	logBrowser log updateTree