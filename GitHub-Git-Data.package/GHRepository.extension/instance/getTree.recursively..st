*GitHub-Git-Data-accessing
getTree: aSHA recursively: aBoolean

	^ aBoolean
		ifTrue: [ self getTreeRecursively: aSHA ]
		ifFalse: [ self getTree: aSHA ]