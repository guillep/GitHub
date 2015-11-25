baselines
baseline03: spec
	<version: '0.3-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/Balletie/GitHub/main/'.
		spec 
			project: 'ZincHTTPComponents' with: [
				spec
					className: #ConfigurationOfZincHTTPComponents;
					versionString: #'stable';
					repository: 'http://mc.stfx.eu/ZincHTTPComponents' ];
			project: 'NeoJSON' with: [
				spec
					className: #ConfigurationOfNeoJSON;
					versionString: #'stable';
					repository: 'http://mc.stfx.eu/Neo' ].
		spec 
			package: #GitHub with: [
				spec requires: #('ZincHTTPComponents' 'NeoJSON' ). ];
			package: #'GitHub-Users' with: [
				spec requires: #(#GitHub ). ];
			package: 'GitHub-Repositories' with: [
				spec requires: #(#GitHub ). ];
			package: #'GitHub-Contents' with: [
				spec requires: #('GitHub-Repositories' ). ];
			package: #'GitHub-Git-Data' with: [
				spec requires: #('GitHub-Repositories' ). ];
			package: #'GitHub-FileTree' with: [
				spec requires: #(#'GitHub-Git-Data' #'GitHub-Users' ). ].
		spec 
			group: 'filetree' with: #(#'GitHub-FileTree' );
			group: 'default' with: #(#'GitHub-Git-Data' #'GitHub-Contents' #'GitHub-Users' ). ].
