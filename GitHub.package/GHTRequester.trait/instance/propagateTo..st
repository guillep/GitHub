response
propagateTo: anObject

	(anObject respondsTo: #github:)
		ifTrue: [
			anObject
				github: self github ].
	^ anObject