I am a requester of information to the GitHub API.

My responsibilities are: allow performing of requests through a simple API (see the operations and response protocols), parsing their responses if successful, and handling the errors when the requests failed. Furthermore, I can cache results and perform conditional requests as per https://developer.github.com/v3/#conditional-requests.

Public API and Key Messages

- All the operations in the operations protocol.
- conditionalGet: to check if the resource at the given URL was modified. If so, responds with the new resource. If not, responds with 304 Not Modified and no resource contents.
- get:cachedResponseAs: uses conditional requests (see above) for caching.
- responseAs: and responseAs:onInvalidFields:: For retrieving the response as a representation.
- onErrorCode:do: and other error handlers in the error handling protocol.