accessing
errorHandlers

	^ errorHandlers ifNil: [ errorHandlers := self defaultErrorHandlers ]