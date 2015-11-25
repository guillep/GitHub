accessing
iconForItem: aLogItem

	| versionId |
	versionId := (GHLocalRepository
		repositoryAt: self repository name
		ifAbsent: [ ^ Smalltalk ui icons blank ]) head.
	^ (versionId beginsWith: aLogItem sha)
		ifTrue: [ Smalltalk ui icons forward ]
		ifFalse: [ Smalltalk ui icons blank ]