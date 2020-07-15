*GitHub-converting
asCamelCaseFromUnderscore
	"For example: 'created_at' asCamelCaseFromUnderscore >> 'CreatedAt' "

	^ (self copyReplaceAll: '_' with: ' ') asCamelCase