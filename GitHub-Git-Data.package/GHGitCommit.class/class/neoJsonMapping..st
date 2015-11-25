accessing
neoJsonMapping: mapper
	super neoJsonMapping: mapper.
	mapper for: self do: [ :mapping |
		#(author committer) do: [ :userStamp |
			(mapping mapInstVar: userStamp) valueSchema: GHGitUserStamp
		].
		(mapping mapInstVar: #tree) valueSchema: #GHGitTreeObject.
		(mapping mapInstVar: #parents) valueSchema: #ArrayOfGitCommitObjects.
	].
	self mapType: 'tree' forSchema: #GHGitTreeObject mapper: mapper.
	self mapType: 'commit' forSchema: #GHGitCommitObject mapper: mapper.
	mapper for: #ArrayOfGitCommitObjects customDo: [ :mapping |
		mapping listOfElementSchema: #GHGitCommitObject
	].