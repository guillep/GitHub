GitHub
======

This project provides bindings to the GitHub API for Pharo. In particular, the aim is to provide bindings using Object-Oriented design principles.

## Installation

To install into Pharo, evaluate the following Metacello script in your Pharo 5 image:

```Smalltalk
Metacello new
	baseline: 'GitHub';
	repository: 'github://Balletie/GitHub:master';
	load.
```

Replace the `master` part with any version tag to load that specific version.

## License

This project is released under the MIT License. See [`LICENSE`](./LICENSE) for details.
