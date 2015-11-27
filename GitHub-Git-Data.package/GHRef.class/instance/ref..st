accessing
ref: aRefSpec
	" Need to use this hack so that we stay consistent internally.. "
	ref := ((aRefSpec beginsWith: 'refs/') ifTrue: '' ifFalse: 'refs/') , aRefSpec