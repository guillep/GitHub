response
propagateClientAndReaderTo: anObject

	((anObject respondsTo: #initializeWithClient:) & anObject respondsTo: #jsonReader:)
		ifTrue: [
			anObject
				initializeWithClient: self clientCopy;
				jsonReader: self readerCopy ].
	^ anObject