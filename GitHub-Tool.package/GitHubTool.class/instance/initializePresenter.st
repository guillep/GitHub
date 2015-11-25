initialization
initializePresenter

	repositoryDropDown whenSelectedItemChanged: [ :newRepo |
		logBrowser repository: newRepo.
		checkoutButton enable.
		commitButton enable.
	].