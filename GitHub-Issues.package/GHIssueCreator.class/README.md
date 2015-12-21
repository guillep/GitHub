I am a creator of issues on a repository. I follow the builder pattern, by taking several parameters (labels, assignee, body, title, milestone) to create an issue (#create).

My collaborator is GHRepository

Public API and Key Messages

  - Visit https://developer.github.com/v3/issues/#create-an-issue for documentation on each parameter.
  - Send issueCreator to a repository to instantiate me. Alternatively, send #on: to my class passing a GHRepository.
  - create: Create the repository with the given parameters.