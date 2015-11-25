*GitHub-Git-Data-writing
writeElement: value as: valueSchema
	self flag: #todo. "Message NeoJSON author about this."
	first 
		ifTrue: [ 
			jsonWriter newlineIndent. 
			first := false ]
		ifFalse: [ 
			jsonWriter listElementSeparator ].
	jsonWriter nextPut: value as: valueSchema