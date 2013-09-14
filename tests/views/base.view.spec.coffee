View = require '../../app/views/Base'

describe 'Base view', ->
	it 'create and render new view', (next) ->
		responseMockup =
			render: (template, data) ->
				expect(data.myProperty).toBe('value')
				expect(template).toBe('template-file')
				next()
		v = new View(responseMockup, 'template-file')
		v.render {myProperty: 'value'}
	
	it 'should be extendable', (next) ->
		v = new View()
		OtherView = v.extend
			render: (data) ->
				expect(data.prop).toBe('yes')
				next()
		otherViewInstance = new OtherView()
		expect(otherViewInstance.render).toBeDefined()
		otherViewInstance.render {prop: 'yes'}