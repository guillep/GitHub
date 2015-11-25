instance creation
onRemoteRepository: aGHRepository

	^ self new
		gitHubRepository: aGHRepository;
		yourself