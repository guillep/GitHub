error handling
errorHandlers

	^ errorHandlers ifNil: [ errorHandlers := self defaultErrorHandlers ]