testing
isItemLoaded: aLogItem

	| repo |
	repo := (GHLocalRepository
		repositoryAt: self repository name
		ifAbsent: [ ^ false ]).
	^ repo head sha beginsWith: aLogItem sha