commit
commitWithMessage: aString
	| dirtyWorkingCopies versions |

	dirtyWorkingCopies := fileTreeRepo allPackageNames
		collect: [ :packageName |
			MCWorkingCopy forPackage: (MCPackage named: packageName).
		]
		thenSelect: [ :workingCopy | workingCopy needsSaving ].

	versions := dirtyWorkingCopies collect: [ :workingCopy |
		workingCopy newVersionWithMessage: aString in: fileTreeRepo.
	].
	self commitVersions: versions withMessage: aString