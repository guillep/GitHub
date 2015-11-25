instance creation
message: aString parents: anArrayOfCommits tree: aSHA

	^ self new
		message: aString;
		parents: anArrayOfCommits;
		tree: aSHA