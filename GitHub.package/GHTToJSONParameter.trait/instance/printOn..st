printing
printOn: aStream
	^ (self jsonWriterOn: aStream) in: [ :writer | 
		" Create the mapping "
		self class neoJsonParameterMapping: writer.
		writer nextPut: self
	]