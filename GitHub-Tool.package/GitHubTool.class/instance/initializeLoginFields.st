initialization
initializeLoginFields

	| usernameInput passwordInput acceptBlock |
	usernameInput := self newTextInputWithDefaults
		ghostText: 'Username or Token'.
	passwordInput := self newTextInputWithDefaults
		ghostText: 'Password or Empty';
		beEncrypted.
	acceptBlock := [ passwordInput text isEmpty
		ifTrue: [
			self authenticatedAPI: (GitHub
				initializeWithAccessToken: usernameInput text)
		]
		ifFalse: [
			self authenticatedAPI: (GitHub
				initializeWithUsername: usernameInput text
				password: passwordInput text)
		]
	].
	usernameInput bindKeyCombination: Character cr toAction: acceptBlock.
	passwordInput bindKeyCombination: Character cr toAction: acceptBlock.
	^ { usernameInput. passwordInput }