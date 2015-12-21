accessing
addLabel: aString
	| newVal |
	newVal := parameters
		at: #labels
		ifPresent: [ :array | (array copyWith: aString) ]
		ifAbsent: [ Array with: aString ].
	parameters
		at: #labels
		put: newVal