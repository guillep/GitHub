private
generateUrlInstVarsMethod
	(self instanceVariables
		select: [ :each | each asString endsWith: '_url' ]
		thenCollect: [ :each | each asSymbol ])
		ifNotEmpty: [ :urlVars |
			self classSide
				compile: (self sourceCodeForUrlInstVars: urlVars)
				classified: 'accessing' ].
