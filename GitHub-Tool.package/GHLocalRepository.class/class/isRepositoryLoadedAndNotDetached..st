testing
isRepositoryLoadedAndNotDetached: aRepositoryName

	| repo |
	repo := self repositoryAt: aRepositoryName ifAbsent: [ ^ false ].
	^ repo isDetached not