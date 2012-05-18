Schema = require('mongoose').Schema

Comment = new Schema
  author: {type: String, match: /^[a-zA-Z0-9_]+$/}
  content: String

exports.Comment = Comment