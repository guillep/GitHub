initialization
initializeLoginFields

	| usernameInput passwordInput acceptBlock |
	usernameInput := self newTextInput
		wantsVisualFeedback: false;
		ghostText: 'Username or Token'.
	passwordInput := self newTextInput
		wantsVisualFeedback: false;
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
	usernameInput acceptBlock: acceptBlock.
	passwordInput acceptBlock: acceptBlock.
	^ { usernameInput. passwordInput }