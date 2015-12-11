accessing
authenticatedUser

	^ authenticatedUser ifNil: [
		self authenticatedAPI ifNotNil: [
			authenticatedUser := self authenticatedAPI user
		]
	]