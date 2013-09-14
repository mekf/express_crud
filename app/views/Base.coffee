module.exports = (response, template) ->
	@response = response
	@template = template
	null

module.exports:: =
	extend: (properties) ->
		Child = module.exports
		Child:: = module.exports::
		for key of properties
			Child::[key] = properties[key]
		Child
	render: (data) ->
		if @response and @template
			@response.render @template, data