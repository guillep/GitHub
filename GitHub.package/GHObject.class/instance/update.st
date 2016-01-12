updating
update
	" If my remote resource has been changed,
	  update all of my fields to the new resource.
	  Otherwise just return myself. "
	| updated |
	self isOutdated ifFalse: [ ^ self ].
	updated := self responseAs: self class.
	self copyFrom: updated