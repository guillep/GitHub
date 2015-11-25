I represent objects that can be converted to and from JSON.

My responsibility is describing how the objects are mapped. If an object is written to a JSON representation, it may not be the same as what it was read as. This is because when we write back to JSON, we do so for using it as a parameter for the API, which needs a slightly different representation.

My collaborators therefore are NeoJSONMapper and NeoJSONMappings.

Public API and Key Messages

- self class>>neoJsonMapping:
- self class>>dateAndTimeInstVars
  Can be overridden to specify more instance variables which are a DateAndTime object
- self class>>urlInstVars
  Can be overridden to specify more instance variables mapped to ZnUrl