I am the main access point for the GitHub API

My responsibility is allowing the user to log in, either with an access token or with a username and password. I can then return API objects, which are subclasses of GHObject.

My main collaborator is ZnClient, which I use to communicate with GitHub's API.