I am a creator of pull requests on GitHub.

I take several simple parameters, namely the title, the body (description of the pull request), and the head and base branches. The title, head and base parameters are required.

I operate on a GHRepository.

Public API and Key Messages

- See the API documentation at https://developer.github.com/v3/pulls/#create-a-pull-request
- Use GHRepository>>pullRequestCreatorWithTitle:head:base: to instantiate me, or use my class side method: on:withTitle:fromHead:toBase: