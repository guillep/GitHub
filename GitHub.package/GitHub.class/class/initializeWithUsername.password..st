initialization
initializeWithUsername: aUsername password: aPassword

	^ self new
		initializeWithClient: (self client
			username: aUsername password: aPassword;
			yourself);
		yourself