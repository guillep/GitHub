initialization
initialize

	super initialize.
	repository := nil asValueHolder.
	repository whenChangedDo: [ :newRepo |
		log roots: (self sortedItemsForRepo: newRepo)
	].