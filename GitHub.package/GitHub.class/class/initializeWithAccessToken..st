initialization
initializeWithAccessToken: anAccessToken
	^ self initializeWithAuthorizationField: 'token ' , anAccessToken