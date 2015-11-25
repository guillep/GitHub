initialization
initializeWidgets

	logBrowser := self instantiate: GitHubLogBrowser.
	repositoryDropDown := self newDropList.
	checkoutButton := self newButton
		label: 'Checkout (Load)';
		disable;
		yourself.
	commitButton := self newButton
		label: 'Commit (Save)';
		disable;
		yourself.