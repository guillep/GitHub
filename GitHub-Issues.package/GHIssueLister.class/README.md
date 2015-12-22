I am a lister of issues in a repository.

I handle the assigning of many parameters, as specified in the documentation at https://developer.github.com/v3/issues/#list-issues-for-a-repository.

My collaborator is GHRepository, which is the operand.

Public API and Key Messages

- See the 'accessing parameters' protocol and the documentation at https://developer.github.com/v3/issues/#list-issues-for-a-repository.
- Send execute to get the listing.
- Create an instance of me by sending issueLister to a GHRepository, or by sending on: to my class with a GHRepository.