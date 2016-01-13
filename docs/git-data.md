Git Data API
============

<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-generate-toc again -->
**Table of Contents**

- [Git Data API](#git-data-api)
    - [Operations on low-level Git concepts](#operations-on-low-level-git-concepts)
    - [Creating a commit.](#creating-a-commit)

<!-- markdown-toc end -->

The low-level [Git Data API](https://developer.github.com/v3/git/) allows you to create or read Git objects (blobs, trees, commits, tags) and create, delete, read and update references (refs).

This document explains how to do this using the API bindings.

## Operations on low-level Git concepts

This API defines two operations on git objects (creating and reading), and four operations on git references (creating, updating, deleting and reading). The former git concepts are immutable and can therefore not be updated or deleted.

The way the API works is that one reads an object or references, changes some of its contents, and then pass it to one of the create, update or delete operations.

For example, to update a ref, one takes the ref object and change the object it is pointing to using the [`GHRef`](../GitHub-Git-Data.package/GHRef.class/README.md)`>>`[`object:`](../GitHub-Git-Data.package/GHRef.class/instance/object..st) accessor. Really, the only information that this new object should have is its SHA.

So in theory, if one knows the name of the ref (for example `refs/heads/master`) and the SHA of the object it is pointing to, one can just create new instances of GHRef and GHObject without ever having to do a request for those objects.

Here is an example of adding a blob to a tree based on the tree pointed to by the last commit on `master`:

```Smalltalk
repo := github user repository: 'FictionalRepository'.
head := repo getRef: 'heads/master'.
commit := repo getCommit: head object sha.
tree := repo getTreeRecursively: commit tree sha.

" Create a new file in-memory "
root := FileSystem memory workingDirectory.
newFile := root / 'README.md'.
newFile writeStreamDo: [ :stream |
	stream nextPutAll: 'Hello from Pharo!' ].
newEntry := GHTreeEntryWithContent
	fromFileReference: newFile
	relativeTo: root.

" Add a new blob entry. The new entries will be added on
  top of the previous entries. "
tree tree: { newEntry }.
repo createTree: tree.
```

## Creating a commit.

The operations described in the previous section are tedious to use if all you want to do is create a commit. Therefore, this process is implemented in the [`GHCommitBuilder`](../GitHub-Git-Data.package/GHCommitBuilder.class/README.md) class. The builder provides several methods which simplify the process of performing a commit:

- **`push`**: This method does all the operations to create a commit, with the parameters given to the builder. Specifically, it does the following operations:
  1. Take the current `HEAD` commit of the given branch (or the default branch of the repository),
  2. Get the tree it points to,
  3. Update the contents of this tree using the given files and create the new one,
  4. Create a new commit object pointing to the new tree,
  5. Update the `HEAD` reference to point to the new commit.
- **`directory:`**: This method takes a `FileReference` containing files, and stages them for the commit as if they were in the root directory of the repository.

	The location of where they should be committed can be overridden by sending `baseDirectory:` afterwards with a `FileReference`. Note that this `FileReference`'s path should be contained within the reference passed to `directory:`.

	An alternative to using `directory:` is to use both `files:` and `baseDirectory:`. The advantage to this is that one can omit files in the commit which are present in the reference passed to `baseDirectory:`.

- **`onBranch:`**: Specify the branch to commit on. This needs to be an existing branch, which can be created by creating a ref, described in the previous section.

- **`replaceTree`**: Let the commit replace the entire tree of the commit it is based on. Of course, this will create a new tree with just the files given. This is the only way to perform a delete operation in a commit.
