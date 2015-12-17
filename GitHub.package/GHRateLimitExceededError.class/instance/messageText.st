accessing
messageText

	^ 'Rate limit of '
		, self limit asString
		, ' exceeded. Try again at '
		, self windowResetDateAndTime asString
		, '.
		API Message: ' , messageText