BaseController = require '../../app/controllers/Base'

describe 'Base controller', ->
	it 'should have a method extend which returns a child instance', (next) ->
		expect(BaseController.extend).toBeDefined()
		child = BaseController.extend 
			name: 'my child controller'
		
		expect(child.run).toBeDefined()
		expect(child.name).toBe('my child controller')
		next()

	it 'should be able to create different childs', (next) ->
		childA = BaseController.extend
			name: 'child A'
			customProperty: 'value'
		
		childB = BaseController.extend
			name: 'child B'
		
		expect(childA.name).not.toBe(childB.name)
		expect(childB.customProperty).not.toBeDefined()
		next()