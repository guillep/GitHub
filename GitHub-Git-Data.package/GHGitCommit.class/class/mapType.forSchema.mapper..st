accessing
mapType: aTypeString forSchema: aTypeSchema mapper: mapper
	mapper for: aTypeSchema customDo: [ :mapping |
		mapping reader: [ :jsonReader |
			(jsonReader nextAs: GHGitObject)
				instVarNamed: #type put: aTypeString;
				yourself.
		]
	].