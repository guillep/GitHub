descriptions
description
	^ self class description , (repo owner at: 'login') , '/' , repo name
		, (self directory hasChildren
		ifTrue: [ ' (loaded)' ]
		ifFalse: [ ' (not loaded)' ])