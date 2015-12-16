private
nullAndCommitPair

	^ self
		putMapping: [ :mapping |
			mapping mapWithValueSchemas: self class nullCommitKeyToSchema ]
		ifAbsentAt: #NullCommitPair