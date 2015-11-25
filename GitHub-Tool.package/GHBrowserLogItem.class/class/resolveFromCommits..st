instance creation
resolveFromCommits: aCollection

	| shaToLogItem |
	shaToLogItem := Dictionary new.
	aCollection do: [ :commit |
		shaToLogItem at: commit sha put: (self fromGHCommit: commit)
	].
	shaToLogItem valuesDo: [ :logItem |
		logItem parents: (logItem commit parents collect: [ :parent |
			shaToLogItem at: (parent at: 'sha')
		])
	].
	^ shaToLogItem values