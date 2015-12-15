login
onAcceptUsername: usernameInput password: passwordInput
	passwordInput text isEmpty
		ifTrue:
			[ self authenticatedAPI: (GitHub
				initializeWithAccessToken: usernameInput text) ]
		ifFalse:
			[ self authenticatedAPI: (GitHub
				initializeWithUsername: usernameInput text
				password: passwordInput text) ].
	self class rememberAuthentication: self authenticatedAPI