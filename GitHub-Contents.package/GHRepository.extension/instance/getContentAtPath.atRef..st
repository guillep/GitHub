*GitHub-Contents-accessing
getContentAtPath: aFileOrDirectoryPath atRef: aRef
	self flag: #todo. "Does not work yet when requesting a directory."
	^ self getAsContent: (self contentApiUrl: aFileOrDirectoryPath) ? ('ref' -> aRef)