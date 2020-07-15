GitHub
======
[Code: ![Build Status](https://travis-ci.org/guillep/GitHub.svg?branch=master)](https://travis-ci.org/guillep/GitHub)
[Docs: ![Build Status](https://travis-ci.org/guillep/GitHub.svg?branch=docs)](https://travis-ci.org/guillep/GitHub)

This project provides bindings to the GitHub API for Pharo. In particular, the aim is to provide bindings using Object-Oriented design principles.

This project was initially developped by [@balletie](https://github.com/balletie).

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
	repository: 'github://guillep/GitHub:master';
	load.
```

Replace the `master` part with any version tag to load that specific version.

## Documentation

Documentation can be found on the [project website](https://guillep.github.io/GitHub). To get started with the API, read ["Getting started"](https://guillep.github.io/GitHub/html-chap/index.html).

## License

This project is released under the MIT License. See [`LICENSE`](./LICENSE) for details.
