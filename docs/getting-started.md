Getting started
===============

<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-generate-toc again -->
**Table of Contents**

- [Getting started](#getting-started)
    - [Initializing the main API entry point](#initializing-the-main-api-entry-point)

<!-- markdown-toc end -->

To start using the API, you need to authenticate yourself. This can be done using either your username and password, or an access token.

An access token can be retrieved using the OAuth2 protocol, using Zinc. To do this, you might want to take a look at the documentation of [Zinc SSO](https://github.com/svenvc/docs/blob/master/zinc/zinc-sso-paper.md).

The access token can also be made manually (called a _Personal access token_), via the following link (you need to be logged in for this link to work): [Personal access tokens](https://github.com/settings/tokens). This is the easiest and quickest way to get started with the API. Note that you should treat this token as a password.

## Initializing the main API entry point

The class `GitHub` functions as the main entry point for the API. From there, one can query either the logged in user (i.e. _you_) or a user by specifying the name, by sending the messages `GitHub>>user` and `GitHub>>user:` respectively. These messages will return an instance of `GHUser`.

```Smalltalk
| github user |

" Initialize using an access token... "
github := GitHub initializeWithAccessToken: 'f1ct10n4l4cc3sst0k3n'.

" ... or using a username and password combination. "
github := GitHub initializeWithUsername: 'JohnDoe' password: '123password'.

" Get the currently logged in user, which returns an instance of GHUser. "
user := github user.

" Get a user by their username. "
user := github user: 'MaryJane'.
```
