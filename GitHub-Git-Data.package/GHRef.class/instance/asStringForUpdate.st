printing
asStringForUpdate
	" When passing this Ref to GHRepository>>updateRef:, this is called
	for the JSON parameter representation. The other parameter representation
	is the one used for createRef. "
	^ String streamContents: [ :stream |
		(self jsonWriterOn: stream)
			for: self class do: [ :mapping |
				mapping
					mapProperty: #sha
						getter: [ :refObject | refObject object sha ]
						setter: [ :refObject :sha | refObject object sha: sha ];
					mapInstVar: #force
			];
			nextPut: self
	]