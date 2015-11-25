accessing
setDateAndTimeMapping: mapper

	mapper for: DateAndTime customDo: [ :mapping |
		mapping decoder: [ :string | string asDateAndTime ].
		mapping encoder: [ :dateAndTime | dateAndTime asString ].
	].