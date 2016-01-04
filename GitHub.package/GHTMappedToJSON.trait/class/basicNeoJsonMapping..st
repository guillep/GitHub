accessing
basicNeoJsonMapping: mapper

	self setDateAndTimeMapping: mapper.
	self setZnUrlMapping: mapper.
	self setAllowNil: mapper.
	mapper for: self do: [ :mapping |
		mapping mapAllInstVars.
		self mapAsDateAndTime: self dateAndTimeInstVars mapping: mapping.
		self mapAsZnUrl: self urlInstVars mapping: mapping.
	].
