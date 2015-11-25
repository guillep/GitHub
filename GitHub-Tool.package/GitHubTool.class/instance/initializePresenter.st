initialization
initializePresenter

	repositoryDropDown whenSelectedItemChanged: [ :newRepo |
		newRepo ifNotNil: [
			logBrowser repository: newRepo.
			checkoutButton enable.
			commitButton enable.
		]
	].