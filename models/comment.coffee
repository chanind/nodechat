mongoose = require('mongoose')

Comment = mongoose.model 'Comment',
  author: {type: String, match: /^[a-zA-Z0-9_]+$/}
  content: String
  
  
exports.Comment (db) -> db.model('Comment')
