file creation
directoryFor: packageName withVersionIdentifier: aString
	^ self directory / (packageName , '-Balletie.' , aString , self packageExtension)