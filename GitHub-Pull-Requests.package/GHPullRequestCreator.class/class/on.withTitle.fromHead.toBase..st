instance creation
on: aRepository withTitle: aTitle fromHead: headString toBase: baseString

	^ (self on: aRepository)
		title: aTitle;
		fromHead: headString;
		toBase: baseString;
		yourself