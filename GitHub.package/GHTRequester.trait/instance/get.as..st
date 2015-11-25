operations
get: urlPathSegments as: aClass
	" Get the result as an instance of aClass, which is a user of GHTRequester.
	I create a copy of my own client. "

	^ (self get: urlPathSegments decodedAs: aClass)
		initializeWithClient: self clientCopy;
		jsonReader: self readerCopy;
		yourself