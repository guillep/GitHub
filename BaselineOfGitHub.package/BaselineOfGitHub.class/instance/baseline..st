baseline
baseline: spec
	<baseline>

	spec for: #'common' do: [
		spec 
			configuration: 'ZincHTTPComponents' with: [
				spec
					version: '2.6.7';
					repository: 'http://mc.stfx.eu/ZincHTTPComponents' ];
			configuration: 'NeoJSON' with: [
				spec
					version: #'bleedingEdge';
					repository: 'http://mc.stfx.eu/Neo' ];
			configuration: 'Hiedra' with: [
				spec
					version: #'development';
					repository: 'http://smalltalkhub.com/mc/MartinDias/Epicea/main/' ].
		spec 
			package: #GitHub with: [
				spec requires: #('ZincHTTPComponents' 'NeoJSON' ). ];
			package: #'GitHub-Users' with: [
				spec requires: #(#GitHub). ];
			package: 'GitHub-Repositories' with: [
				spec requires: #(#GitHub 'GitHub-Users'). ];
			package: #'GitHub-Contents' with: [
				spec requires: #('GitHub-Repositories'). ];
			package: #'GitHub-Git-Data' with: [
				spec requires: #('GitHub-Repositories') ];
			package: #'GitHub-Issues' with: [
				spec requires: #('GitHub-Repositories'). ];
			package: #'GitHub-Pull-Requests' with: [
				spec requires: #('GitHub-Issues'). ];

			package: #'GitHub-Tests' with: [
				spec requires: #('default') ];

			package: #'GitHub-FileTree' with: [
				spec requires: #(#'GitHub-Git-Data'). ];
			package: #'Widget-Extensions-Balletie' with: [
				spec file: 'Widget-Extensions-Balletie-SkipLentz.7'.
  				spec repository: 'http://smalltalkhub.com/mc/Balletie/Widget-Extensions/main/'. ];
			package: 'GitHub-Tool' with: [
				spec requires: #(#'GitHub-FileTree' 'Hiedra' 'Widget-Extensions-Balletie' ). ].
		spec
			group: 'default' with: #(#'GitHub-Contents' #'GitHub-Git-Data' #'GitHub-Pull-Requests' );
			group: 'tests' with: #(#'GitHub-Tests' 'default');
			group: 'tool' with: #('GitHub-Tool' ). ].
