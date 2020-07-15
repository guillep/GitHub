generation
generateInstanceVariablesAndMethodsWithAPIKeys: anArray
	| apiKeys |
	apiKeys := anArray deepCopy.
	apiKeys do: [ :each | 
		| selector |
		selector := each asCamelCaseFromUnderscore asValidSelector.
		((self allSelectorsAboveUntil: GHRelObject) includes: selector)
			ifFalse: [
				self addInstVarNamed: each.
				self
					compile: (self sourceCodeForAccessorNamed: selector key: each)
					classified: 'accessing-api' ] ].

	self generateUrlInstVarsMethod.
	self generateDateAndTimeInstVarsMethod.
