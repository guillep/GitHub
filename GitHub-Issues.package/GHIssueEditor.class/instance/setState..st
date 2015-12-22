accessing
setState: aBoolean

	parameters
		at: 'state'
		put: (aBoolean
			ifTrue: 'open'
			ifFalse: 'closed')