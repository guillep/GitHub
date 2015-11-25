accessing
directoryFor: packageName withSHA: shortCommitSHA
	^ self directory / (packageName , '.' , shortCommitSHA , self packageExtension)