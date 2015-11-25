accessing
mapAsSchema: aSchema array: anArray mapping: mapping

	anArray do: [ :each |
		(mapping
			propertyNamed: each
			ifAbsent: [ mapping mapInstVar: each ])
		valueSchema: aSchema
	].