initialization
initialize

	super initialize.
	repository := nil asValueHolder.
	branch := nil asValueHolder.
	{ repository. branch } do: [ :each |
		each whenChangedDo: [ :dummy |
			log roots: self sortedLogItems ]
	].