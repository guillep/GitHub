initialization
initialize

	super initialize.
	repository := nil asValueHolder.
	branch := nil asValueHolder.
	selectedItem := nil asValueHolder.
	branch whenChangedDo: [ :dummy |
		log roots: self sortedLogItems ]