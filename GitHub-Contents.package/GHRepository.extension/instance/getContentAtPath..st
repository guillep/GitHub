*GitHub-Contents-accessing
getContentAtPath: aFileOrDirectoryPath
	^ self getAsContent: (self contentApiUrl: aFileOrDirectoryPath)