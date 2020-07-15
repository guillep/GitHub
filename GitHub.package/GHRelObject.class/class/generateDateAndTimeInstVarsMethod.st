private
generateDateAndTimeInstVarsMethod
	(self instanceVariables
		select: [ :each | each asString endsWith: '_at' ]
		thenCollect: [ :each | each asSymbol ])
		ifNotEmpty: [ :dateAndTimeVars |
			self classSide
				compile: (self sourceCodeForDateAndTimeInstVars: dateAndTimeVars)
				classified: 'accessing' ]