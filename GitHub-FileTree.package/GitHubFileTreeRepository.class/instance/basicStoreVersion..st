storing
basicStoreVersion: aVersion

	super basicStoreVersion: aVersion.
	repo commitBuilder
		replaceTree;
		directory: self directory;
		withMessage: aVersion info message;
		onBranch: branch;
		push.