actions
checkoutSelectedVersion

	| repo selected |
	selected := logBrowser log selectedItem content.
	repo := GHLocalRepository
		getOrCreateRepositoryForRemote: logBrowser repository.
	repo checkoutSha: selected sha.
	logBrowser log updateTree