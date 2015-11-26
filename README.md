GitHub
======

This project provides bindings to the GitHub API for Pharo. In particular, the aim is to provide bindings using Object-Oriented design principles.

<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-generate-toc again -->
**Table of Contents**

- [GitHub](#github)
    - [Installation](#installation)
    - [Documentation](#documentation)
    - [License](#license)

<!-- markdown-toc end -->

## Installation

To install into Pharo, evaluate the following Metacello script in your Pharo 5 image:

```Smalltalk
Metacello new
	baseline: 'GitHub';
	repository: 'github://Balletie/GitHub:master';
	load.
```

Replace the `master` part with any version tag to load that specific version.

## Documentation

Documentation can be found in the [`docs` directory](./docs/). To get started with the API, read ["Getting started"](./docs/getting-started.md).

## License

This project is released under the MIT License. See [`LICENSE`](./LICENSE) for details.
