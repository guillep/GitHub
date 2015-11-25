initialization
initializeWithAuthorizationField: aString

	^ self new
		initializeWithClient: (self client
			headerAt: 'Authorization' put: aString;
			yourself);
		yourself