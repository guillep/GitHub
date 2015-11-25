accessing
iconForItem: aLogItem

	^ (self isItemLoaded: aLogItem)
		ifTrue: [ Smalltalk ui icons forward ]
		ifFalse: [ Smalltalk ui icons blank ]