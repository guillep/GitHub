Internals
=========

<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-generate-toc again -->
**Table of Contents**

- [Internals](#internals)
    - [Requesters](#requesters)
    - [Response Parsing](#response-parsing)
        - [Generating instance variables, accessors and mapping definitions](#generating-instance-variables-accessors-and-mapping-definitions)
    - [Error Handling](#error-handling)
    - [Conditional Requests](#conditional-requests)

<!-- markdown-toc end -->

This doc explains more on the internals of the API.

## Requesters

A Requester is any API object which can make further requests. In the case of [`GHContent`](../GitHub-Contents.package/GHContent.class/README.md) for example, one can send [`GHContent`](../GitHub-Contents.package/GHContent.class/README.md)`>>`[`updateContent:withMessage:`](../GitHub-Contents.package/GHContent.class/instance/updateContent.withMessage..st). Requesters are users of the [`GHTRequester`](../GitHub.package/GHTRequester.trait/README.md) trait.

Not all API objects are Requesters. A good example are the subclasses of [`GHGitObject`](../GitHub-Git-Data.package/GHGitObject.class/README.md) and [`GHRef`](../GitHub-Git-Data.package/GHRef.class/README.md), which are mutable for the purpose of passing them as parameters (more on the Git Data API [here](git-data.md)).

Requesters can be more easily seen around Zinc's `ZnClient` class. Like `ZnClient`, Requesters are stateful. Requesters expand Zinc with functionality for the API. In short, these functionalities are:

- Parsing the JSON representation to an API object
- Error handling
- Conditional requests

The following sections will go more in-depth on them.

## Response Parsing

The parsing of the JSON is done with the excellent NeoJSON library (read [this doc](https://github.com/svenvc/docs/blob/master/neo/neo-json-paper.md) for an introduction). In NeoJSON there is the concept of a mapping, which defines how to read from (and write to) a JSON representation into an instantiated object. The mapping of an object can be one of `ObjectMapping` or `CustomMapping`. The first is one that maps to a class' properties (in our case just instance variables), the latter is one that allows for a custom definition of a mapping (how the value should be interpreted).

The API bindings provide a trait, [`GHTMappedToJSON`](../GitHub.package/GHTMappedToJSON.trait/README.md), which contains only class-side methods related to NeoJSON mappings. The trait includes the mapping of URLs (instances of `ZnUrl`) and `DateAndTime` instance variables. Users of this trait can then extend the mappings with custom ones for other types.

### Generating instance variables, accessors and mapping definitions

When creating a new API object, one might want to generate some of the instance variables, accessors and mapping definitions automatically.

This can be done using [`GHRelObject`](../GitHub.package/GHRelObject.class/README.md)`class>>`[`generateInstanceVariablesAndMethodsWithAPIKeys:`](../GitHub.package/GHRelObject.class/class/generateInstanceVariablesAndMethodsWithAPIKeys..st), which when provided an array of API keys (e.g. `created_at`, `username`), generates instance variables and accessors for them.

Furthermore, API keys with the suffix `_url` are automatically set to be mapped as `ZnUrl`, and those ending with `_at` will be mapped to `DateAndTime` instances.

## Error Handling

The handling of errors is done before parsing the response. The error handlers are defined as `BlockClosure`s which take a response as argument. They are stored in a `Dictionary` with as their key the HTTP integer error code (e.g. `404`). By default they trigger an `Error`, which allows one to use the regular Smalltalk syntax for handling them:

```smalltalk
[ github user ]
   on: GHBadCredentialsError
   do: [ UIManager default inform: 'Incorrect username or password!' ]
```

## Conditional Requests

Conditional requests allow one to test if a resource was modified. If it was modified, one gets back the new resource as JSON. If not, the response will be `304 Not Modified` without any content (for reducing bandwidth).

The check of whether or not a resource has changed is done with a hash value called an *ETag*. Any Requester has access to these ETags using the [`GHTRequester`](../GitHub.package/GHTRequester.trait/README.md)`>>`[`urlToETag`](../GitHub.package/GHTRequester.trait/instance/urlToETag.st) accessor.

A conditional request is made by sending [`GHTRequester`](../GitHub.package/GHTRequester.trait/README.md)`>>`[`conditionalGet:`](../GitHub.package/GHTRequester.trait/instance/conditionalGet..st) with an URL. It uses the `#urlToETag` `Dictionary` to get the ETag when a new request is made. However it is probably not necessary to use this method directly.

Often one wants to ask to a domain object whether its remote resource has changed. This is provided by [`GHObject`](../GitHub.package/GHObject.class/README.md)`>>`[`isOutdated`](../GitHub.package/GHObject.class/instance/isOutdated.st), which performs a conditional request (if necessary) with its own url as argument.

Even more often one wants to ask a domain object to update itself if it changed, which can be done using [`GHObject`](../GitHub.package/GHObject.class/README.md)`>>`[`update`](../GitHub.package/GHObject.class/instance/update.st). This method uses `#isOutdated` internally, and if it returns true it copies all the instance variables of the response to itself.
