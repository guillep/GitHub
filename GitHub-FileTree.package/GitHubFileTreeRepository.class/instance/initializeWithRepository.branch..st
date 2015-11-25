initialization
initializeWithRepository: aGHRepository branch: aBranchNameOrEmptyOrNil

	repo := aGHRepository.
	branch := aBranchNameOrEmptyOrNil isEmptyOrNil
		ifTrue: [ repo defaultBranch ]
		ifFalse: [ aBranchNameOrEmptyOrNil ].