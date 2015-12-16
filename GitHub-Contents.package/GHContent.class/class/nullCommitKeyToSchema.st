private
nullCommitKeyToSchema

	^ nullCommitKeyToSchema ifNil: [
		nullCommitKeyToSchema := {
			#commit -> GHGitCommit
		} asDictionary ]