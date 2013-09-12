describe 'MongoDB', ->
	it 'is there a server running', (next) ->
		MongoClient = require('mongodb').MongoClient
		MongoClient.connect "mongodb://#{config.mongo.host}:#{config.mongo.port}/fastdelivery", (err, db) ->
			if err
				console.log 'Sorry, there is no mongo db server running.'
			else
				attachDB = (req, res, next) ->
					req.db = db
					next()
				http.createServer(app).listen config.port, ->
					console.log "Express server listening on port #{config.port}"