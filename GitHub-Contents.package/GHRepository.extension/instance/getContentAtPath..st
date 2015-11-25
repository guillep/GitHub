*GitHub-Contents-accessing
getContentAtPath: aFileOrDirectoryPath
	self flag: #todo. "Does not work yet when requesting a directory."
	^ self getAsContent: (self contentApiUrl: aFileOrDirectoryPath)