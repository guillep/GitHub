accessing parameters
withLabels: aCollectionOfStrings
	| commaSep |
	commaSep := $, join: aCollectionOfStrings.
	parameters at: 'labels' put: commaSep