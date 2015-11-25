initialization
clientCopy
	" Create a copy of the client. Is a method because some subclasses
	may require to have a deeper copy. "

	^ (self client copy)
		request: (self client request copy);
		yourself