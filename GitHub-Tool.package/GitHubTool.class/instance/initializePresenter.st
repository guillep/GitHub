initialization
initializePresenter

	repositoryDropDown whenSelectedItemChanged: [ :newRepo |
		newRepo ifNotNil: [ | newBranches |
			logBrowser repository: newRepo.
			commitButton enabled: (GHLocalRepository
				isRepositoryLoadedAndNotDetached: newRepo name).
			newBranches := newRepo branches.
			branchesDropDown items: newBranches.
			newBranches 
				detect: [ :each | each name = newRepo defaultBranch ]
				ifFound: [ :initialSelection | 
					branchesDropDown setSelectedItem: initialSelection]
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

	logBrowser whenSelectedItemChanged: [ :item | | filetreeRepo |
		checkoutButton enable.
		filetreeRepo := GitHubFileTreeRepository new
			initializeWithRepository: repositoryDropDown selectedItem
			branch: (item sha first: 7).
		logBrowser packageList items: filetreeRepo allFileNames ]