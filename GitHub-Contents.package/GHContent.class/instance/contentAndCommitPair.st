private
contentAndCommitPair

	^ self
		putMapping: [ :mapping |
			mapping mapWithValueSchemas: self class contentCommitKeyToSchema ]
		ifAbsentAt: #ContentCommitPair