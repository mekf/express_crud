describe 'MongoDB', ->
	it 'is there a server running', (next) ->
		MongoClient = require('mongodb').MongoClient
		MongoClient.connect 'mongodb://127.0.0.1:27017/fastdelivery', (err, db) ->
			expect(err).toBe(null)
			expect(db).toBeDefined()
			next()