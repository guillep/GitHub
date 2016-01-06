response
propagateTo: anObject

	| propagationBlock |
	propagationBlock := [ :requester |
		(requester respondsTo: #github:)
			ifTrue: [ requester github: self github ] ].
	anObject isCollection
		ifTrue: [ anObject do: propagationBlock ]
		ifFalse: [ propagationBlock value: anObject ].
	^ anObject