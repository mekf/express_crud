Model = require('../../app/models/Base')
dbMockup = {}
describe 'Models', ->
  it 'should create a new model', (next) ->
    model = new Model(dbMockup)
    expect(model.db).toBeDefined()
    expect(model.extend).toBeDefined()
    next()

  it 'should be extendable', (next) ->
    model = new Model(dbMockup)
    OtherTypeOfModel = model.extend
    	myCustomModelMethod: ->
    model2 = new OtherTypeOfModel(dbMockup)
    expect(model2.db).toBeDefined()
    expect(model2.myCustomModelMethod).toBeDefined()
    next()