class Nodechat.Collections.Comments extends Backbone.Collection
  
  url: '/comments'
  
  model: Nodechat.Models.Comment
  
  initialize: ->
    _.bindAll(this, 'serverCreate', 'collectionCleanup')
    @ioBind('create', socket, @serverCreate, this)
