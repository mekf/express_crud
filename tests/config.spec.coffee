describe 'Configuration setup', ->
	it 'should load local configs', (next) ->
		config = require('../config')()
		expect(config.mode).toBe('local')
		next()

	it 'should load staging configs', (next) ->
		config = require('../config')('staging')
		expect(config.mode).toBe('staging')
		next()

	it 'should load production configs', (next) ->
		config = require('../config')('production')
		expect(config.mode).toBe('production')
		next()