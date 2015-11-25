baselines
baseline01: spec
	<version: '0.1-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec 
			project: 'NeoJSON' with: [
				spec
					className: #ConfigurationOfNeoJSON;
					versionString: #'stable';
					repository: 'http://mc.stfx.eu/Neo' ];
			project: 'ZincHTTPComponents' with: [
				spec
					className: #ConfigurationOfZincHTTPComponents;
					versionString: #'stable';
					repository: 'http://mc.stfx.eu/ZincHTTPComponents' ].
		spec 
			package: #GitHub with: [
				spec requires: #('ZincHTTPComponents' 'NeoJSON' ). ];
			package: #'GitHub-Users' with: [
				spec requires: #(#GitHub ). ]. ].
