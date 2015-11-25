initialization
initializePresenter

	repositoryDropDown whenSelectedItemChanged: [ :newRepo |
		newRepo ifNotNil: [
			logBrowser repository: newRepo.
			checkoutButton enable.
			commitButton enabled: (GHLocalRepository
				isRepositoryLoadedAndNotDetached: newRepo name).
			branchesDropDown items: newRepo branches
		]
	].
	branchesDropDown whenSelectedItemChanged: [ :newBranch |
		newBranch ifNotNil: [
			logBrowser branch: newBranch
		]
	].

	createBranchButton action: [ self createBranch ].
	checkoutButton action: [ self checkoutSelectedVersion ].
	commitButton action: [ self commit ].

	logBrowser log whenSelectedItemsChanged: [ :items | | filetreeRepo |
		items isEmptyOrNil ifFalse: [
			filetreeRepo := GitHubFileTreeRepository new
				initializeWithRepository: repositoryDropDown selectedItem
				branch: (items first sha first: 7).
			logBrowser packageList items: filetreeRepo allFileNames
		]
	]