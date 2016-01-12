testing
isOutdated
	" Perform a conditional request to see if
	  I was modified. "
	^ (self conditionalGet: self url) not