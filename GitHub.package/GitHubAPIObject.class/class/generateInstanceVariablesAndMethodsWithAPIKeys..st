generation
generateInstanceVariablesAndMethodsWithAPIKeys: anArray
	| apiKeys dateAndTimeVars urlVars|

	apiKeys := anArray copy.
	apiKeys do: [ :each | | eachtwo selector |
		eachtwo := each copy.
		selector := (each replaceAll: $_ with: Character space) asCamelCase asLegalSelector.
		((self allSelectorsAboveUntil: GitHubAPIObject) includes: selector)
			ifFalse: [
				self addInstVarNamed: eachtwo.
				self
					compile: selector asString , '
	^ ' , eachtwo
					classified: 'accessing-api'
			]
	].
	dateAndTimeVars := self instanceVariables
		select: [ :each | (each asString last: 3) = '_at' ]
		thenCollect: [ :each | each asSymbol ].
	urlVars := self instanceVariables
		select: [ :each | (each asString last: 4) = '_url' ]
		thenCollect: [ :each | each asSymbol ].
	self
		compile: 'urlInstVars' , '
	^ (super urlInstVars) , ' , (urlVars asString)
		classified: 'accessing'.
	self
		compile: 'dateAndTimeInstVars' , '
	^ (super dateAndTimeInstVars) , ' , (dateAndTimeVars asString)
		classified: 'accessing'.