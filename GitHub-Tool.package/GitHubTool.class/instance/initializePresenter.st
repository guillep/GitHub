initialization
initializePresenter

	repositoryDropDown whenSelectedItemChanged: [ :newRepo |
		newRepo ifNotNil: [
			logBrowser repository: newRepo.
			checkoutButton enable.
			commitButton enable.
		]
	].
	logBrowser log whenSelectedItemsChanged: [ :items | | filetreeRepo |
		items isEmptyOrNil ifFalse: [
			filetreeRepo := GitHubFileTreeRepository
				initializeWithAPI: self authenticatedAPI
				owner: (repositoryDropDown selectedItem owner at: 'login')
				repository: repositoryDropDown selectedItem name
				branch: (items first sha first: 7).
			logBrowser packageList items: filetreeRepo allFileNames
		].
	]