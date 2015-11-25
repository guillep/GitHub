private
sortedItemsForRepo: aGHRepository

	| items |
	items := GHBrowserLogItem resolveFromRepository: aGHRepository.
	items sort: [ :a :b | a commitTime > b commitTime ].
	^ items