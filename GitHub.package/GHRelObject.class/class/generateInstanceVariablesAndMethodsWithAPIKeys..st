generation
generateInstanceVariablesAndMethodsWithAPIKeys: anArray
	| apiKeys dateAndTimeVars urlVars|

	apiKeys := anArray deepCopy.
	apiKeys do: [ :each | | eachtwo selector |
		eachtwo := each copy.
		selector := (each replaceAll: $_ with: Character space) asCamelCase asValidSelector.
		((self allSelectorsAboveUntil: GHRelObject) includes: selector)
			ifFalse: [
				self addInstVarNamed: eachtwo.
				self
					compile: selector asString , '
	^ ' , eachtwo
					classified: 'accessing-api'
			]
	].
	dateAndTimeVars := self instanceVariables
		select: [ :each | (each size > 2) and: [(each asString last: 3) = '_at'] ]
		thenCollect: [ :each | each asSymbol ].
	urlVars := self instanceVariables
		select: [ :each | (each size > 3) and: [(each asString last: 4) = '_url'] ]
		thenCollect: [ :each | each asSymbol ].
	urlVars isEmpty ifFalse: [ self classSide
		compile: 'urlInstVars' , '
	^ (super urlInstVars) , ' , (urlVars asString)
		classified: 'accessing' ].
	dateAndTimeVars isEmpty ifFalse: [ self classSide
		compile: 'dateAndTimeInstVars' , '
	^ (super dateAndTimeInstVars) , ' , (dateAndTimeVars asString)
		classified: 'accessing' ].