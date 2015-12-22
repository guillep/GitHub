I am a builder which builds new objects by executing requests with a given requester, passing the specified parameters to the request.

My responsibility is to build up the query parameters and execute it on the requester. I encapsulate how these parameters are given to the request. Furthermore, I validate whether the required parameters were given.

My collaborator is a user of GHTRequester.

Public API and Key Messages

- execute: Execute the request
- requiredParameters: The parameters that should be present when executing the request.
- operation: The HTTP operation, one of GET/PUT/POST/PATCH/DELETE.
- self class>>on: to instantiate me on a requester.

Internal Representation and Key Implementation Points.

    Instance Variables
	parameters:		The query parameters. (Dictionary)
	operandRequester: The operand requester which is the subject of the operation.