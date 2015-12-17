*GitHub-Contents
mapWithValueSchemas: keyToValueSchema
	"Set the reader to a block that will create an instance of the
	standard mapClass while reading values of type valueSchema,
	with standard keys"

	self reader: [ :jsonReader | | map |
		map := jsonReader mapClass new.
		jsonReader parseMapKeysDo: [ :key | | value schema |
				schema := keyToValueSchema at: key ifAbsent: nil.
				value := schema
					ifNil: [ jsonReader next ]
					ifNotNil: [ jsonReader nextAs: schema ].
				map at: key put: value ].
		map ]
	"we do not set a writer, #neoJsonOn: should be sufficient"
