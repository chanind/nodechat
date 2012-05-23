mongoose = require 'mongoose'
Comment = mongoose.model('Comment')

exports.create = (socket, data, callback) ->
  comment = new Comment()
  comment.content = data.content
  comment.author = data.author
  comment.save (err) ->
    callback(err)
    socket.broadcast.emit('/comments:create', comment.toObject()) unless err
  
exports.read = (socket, data, callback) ->
  Comment.find {}, (err, docs) ->
    docObjects = docs.map (doc) -> doc.toObject()
    callback(err, docObjects)
      
  