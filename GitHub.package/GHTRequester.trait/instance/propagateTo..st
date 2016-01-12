response
propagateTo: anObject

	| propagationBlock |
	propagationBlock := [ :requester |
		(requester respondsTo: #github:)
			ifTrue: [ requester github: self github ].
		" GHObject requires its ETag to check if he is outdated.
		  See comment in GHObject>>isOutdated and GHObject>>eTag:"
		(requester respondsTo: #eTag:)
			ifTrue: [
				requester eTag: (self urlToETag
					at: requester url ifAbsent: nil) ] ].
	anObject isCollection
		ifTrue: [ anObject do: propagationBlock ]
		ifFalse: [ propagationBlock value: anObject ].
	^ anObject