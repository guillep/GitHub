private
contentCommitKeyToSchema

	^ contentCommitKeyToSchema ifNil: [
		contentCommitKeyToSchema := {
			#content -> GHContent.
			#commit -> GHGitCommit
		} asDictionary ]