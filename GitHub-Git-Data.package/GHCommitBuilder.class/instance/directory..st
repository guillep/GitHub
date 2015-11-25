accessing-files
directory: aFileReference

	| visitor guide |
	self baseDirectory: aFileReference.

	" Breadth first traversal of all files, ignoring .git directory. "
	visitor := SelectVisitor select: [ :entry | entry isFile ].
	guide := (BreadthFirstGuide for: visitor)
		selectChildren: [ :entry | (entry basename = '.git') not ].
	self files: ((visitor visit: aFileReference with: guide)
		collect: [ :entry | entry asFileReference ])