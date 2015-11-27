loading
load
	| packageSnapshots |
	fileTreeRepo loadContents.
	packageSnapshots := fileTreeRepo allFileNames.
	('Loading ' , self gitHubRepository name , '@' , self head sha)
		displayProgressFrom: 0 to: packageSnapshots size during: [ :job |
			packageSnapshots do: [ :packageName |
				job increment.
				(fileTreeRepo versionFromFileNamed: packageName)
					load ]
		]