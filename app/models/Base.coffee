module.exports = (db) ->
  @db = db
  null
  # true
  # return
  # undefined
  # If I don't do this then test will fail
  # Any of these will work, refer to note for proper explaination

module.exports:: =
  extend: (properties) ->
    Child = module.exports
    Child:: = module.exports::
    for key of properties
      Child::[key] = properties[key]
    Child

  setDB: (db) ->
    @db = db
    null

  collection: ->
    return @_collection  if @_collection
    @_collection = @db.collection("fastdelivery-content")

###
Original JS script: Note that 'this.db = db' does not have return in front of it
If I write @db = db then obviously Coffee will compile to 'return this.db = db' and the tests will fail

module.exports = function(db) {
  this.db = db;
};
module.exports.prototype = {
  extend: function(properties) {
    var Child = module.exports;
    Child.prototype = module.exports.prototype;
    for(var key in properties) {
      Child.prototype[key] = properties[key];
    }
    return Child;
  },
  setDB: function(db) {
    this.db = db;
  },
  collection: function() {
    if(this._collection) return this._collection;
    return this._collection = this.db.collection('fastdelivery-content');
  }
}

Explaination:
http://stackoverflow.com/questions/7391493/is-there-any-way-to-not-return-something-using-coffeescript

Be careful that you're not accidentally returning the results of the comprehension in these cases, by adding a meaningful return value — like true — or null, to the bottom of your function.
###