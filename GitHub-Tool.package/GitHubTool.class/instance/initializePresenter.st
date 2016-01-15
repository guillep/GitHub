initialization
initializePresenter

	repositoryDropDown whenSelectedItemChanged: [ :newRepo |
		newRepo ifNotNil: [ | newBranches initialSelection |
			logBrowser repository: newRepo.
			checkoutButton enable.
			commitButton enabled: (GHLocalRepository
				isRepositoryLoadedAndNotDetached: newRepo name).
			newBranches := newRepo branches.
			initialSelection := newBranches detect: [ :each |
				each name = newRepo defaultBranch ].
			branchesDropDown
				items: newBranches;
				setSelectedItem: initialSelection
		]
	].
	branchesDropDown whenSelectedItemChanged: [ :newBranch |
		newBranch ifNotNil: [
			logBrowser log deselectAll.
			logBrowser branch: newBranch.
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