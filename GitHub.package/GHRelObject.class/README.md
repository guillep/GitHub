I am an object which can create new objects relative to me. For example, a user can be asked for its repositories.

Being a user of the GHTRequester trait, I can instantiate new objects which in turn are able to make requests (see propagateTo:). I delegate this behavior to a GitHub instance.

My collaborator is GitHub, the main API access point.

- github and github:: Accessors to the main access point.
- See GHTRequester for more of my behavior.

Internally I delegate to a GitHub instance (see accessing protocol), which contains the ZnClient to make requests, the JSON reader to parse the responses of those requests if successful, and the error handlers in case the response failed.