accessing
mode: aModeString
	" From GitHub API v3 Reference: 
	  The file mode; one of 100644 for file (blob), 100755 for executable (blob),
	  040000 for subdirectory (tree), 160000 for submodule (commit), or 120000 for
	  a blob that specifies the path of a symlink"

	mode := aModeString