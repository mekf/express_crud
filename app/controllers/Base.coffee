_ = require 'underscore'

module.exports = 
	name: 'base'
	extend: (child) ->
		_.extend {}, @, child
	run: (req, res, next) ->