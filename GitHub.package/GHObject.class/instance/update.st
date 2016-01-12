updating
update
	" If my remote resource has been changed,
	  update all of my fields to the new resource.
	  Otherwise just return myself. "
	| hasPerformedRequest updated |
	hasPerformedRequest := false.
	self client prepareRequest: [ :request |
		hasPerformedRequest := true ].

	self isOutdated ifFalse: [ ^ self ].

	hasPerformedRequest ifFalse: [ self get: self url ].
	updated := self responseAs: self class.
	self copyFrom: updated.
	self client prepareRequest: nil