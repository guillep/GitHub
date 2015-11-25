actions
commit
	| repo komitter versions message |
	repo := GHLocalRepository
		getOrCreateRepositoryForRemote: logBrowser repository.
	KomitStagingArea resetCurrent.
	komitter := Komitter new
		stagingArea: KomitStagingArea current.
	komitter openAndDo: [ komitter lastCommit ifNotNil: [
		versions := MCKomitSubmitter new
			createVersionFor: komitter lastCommit.
		message := versions first info message asString.
		repo commitVersions: versions withMessage: message.
	] ].