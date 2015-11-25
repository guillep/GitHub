I am an object which can be converted to a JSON representation suitable for parameters of a PUT/POST/DELETE/etc. request.

Key methods:
- neoJsonParameterMapping
  Specifies the mapping of this object >>as parameter<<. This is in contrast with neoJsonMapping: in GHTMappedToJSON, which aims to define a complete one-to-one mapping.