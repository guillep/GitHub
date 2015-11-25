baselines
baseline04: spec
	<version: '0.4-baseline'>

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
					repository: 'http://mc.stfx.eu/Neo' ];
			project: 'Hiedra' with: [
				spec
					className: #ConfigurationOfHiedra;
					versionString: #'development';
					repository: 'http://smalltalkhub.com/mc/MartinDias/Epicea/main/' ].
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
				spec requires: #(#'GitHub-Git-Data' #'GitHub-Users' ). ];
			package: #'Widget-Extensions-Balletie' with: [
				spec file: 'Widget-Extensions-Balletie-SkipLentz.3'.
  				spec repository: 'http://smalltalkhub.com/mc/Balletie/Widget-Extensions/main/'. ];
			package: 'GitHub-Tool' with: [
				spec requires: #(#'GitHub-FileTree' 'Hiedra' 'Widget-Extensions-Balletie' ). ].
		spec 
			group: 'filetree' with: #(#'GitHub-FileTree' );
			group: 'default' with: #(#'GitHub-Git-Data' #'GitHub-Contents' #'GitHub-Users' );
			group: 'tool' with: #('GitHub-Tool' ). ].
