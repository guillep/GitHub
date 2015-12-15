accessing
displayProgress

	workBlock := [ ('Committing to' , repo name , '@' , ref)
		displayProgressFrom: 0 to: 1 during: [ :job |
			self doPush.
			job currentValue: job max ] ]