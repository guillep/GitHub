accessing
directoryFor: packageName withVersionIdentifier: aString
	^ self directory / (packageName , '.' , aString , self packageExtension)