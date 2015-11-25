loading
loadBranchOrVersionAtSha: aBranchOrShaString

	('Loading ' , self gitHubRepository name , '@' , aBranchOrShaString)
		displayProgressFrom: 0 to: 2 during: [ :job |
			fileTreeRepo := GitHubFileTreeRepository new
				initializeWithRepository: self gitHubRepository
				branch: aBranchOrShaString.
			fileTreeRepo allPackageNames do: [ :packageName | | wc |
				wc := MCWorkingCopy forPackage: (MCPackage named: packageName).
				wc repositoryGroup addRepository: fileTreeRepo
			].
			job increment.
			self load.
			job currentValue: job max
		]