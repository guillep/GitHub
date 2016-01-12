testing
isOutdated
	" Perform a conditional request to see if
	  I was modified.
	  First checks if my own ETag is outdated
	  w.r.t. the most up-to-date one.
	  Then checks if I am outdated w.r.t.
	  the resource I represent"
	| mostUpToDate |
	mostUpToDate := self mostUpToDateETag.
	^ eTag ~= mostUpToDate
		or: [ mostUpToDate isNil
		or: [ (self conditionalGet: self url) not ] ]