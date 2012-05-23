class Nodechat.Collections.Comments extends Backbone.Collection
  
  url: '/comments'
  
  model: Nodechat.Models.Comment
  
  initialize: ->
    @ioBind('create', window.socket, _.bind(@ioAddComment, this), this)
  
  ioAddComment: (comment) ->
    @add(comment)
