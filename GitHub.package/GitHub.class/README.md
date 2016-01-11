I am the main access point for the GitHub API

My responsibility is allowing the user to log in, either with an access token or with a username and password. I can then return API objects, which are subclasses of GHObject. From there, requests can be made as specified in GHTRequester.

My main collaborator is ZnClient, which I use to communicate with GitHub's API.

- See GHTRequester for my behavior.
- Caching is lazily initialized, so it is disabled by default.
- Initialize me using self class>>initializeWithUsername:password: or self class>>initializeWithAccessToken: