accessing
setDateAndTimeMapping: mapper

	mapper for: DateAndTime customDo: [ :mapping |
		mapping decoder: [ :string |
			string ifNil: nil ifNotNil: [ string asDateAndTime ] ].
		mapping encoder: [ :dateAndTime |
			dateAndTime ifNil: nil ifNotNil: [ dateAndTime asString ] ].
	].