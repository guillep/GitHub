accessing parameters
withLabels: aCollectionOfStrings
	| commaSep |
	commaSep := String streamContents: [ :stream |
		aCollectionOfStrings
			asStringOn: stream delimiter: ',' ].
	parameters at: 'labels' put: commaSep