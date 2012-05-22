class Nodechat.Views.ChatIndex extends Backbone.View
  
  template: JST['chat_index']
  
  initialize: ->
    @comments = new Nodechat.Collections.Comments()
    @comments.fetch()
    @comments.on('reset', @render, this)
    @comments.on('add', @addComment, this)
  
  render: ->
    $(@el).html(@template())
    this
    
  addComment: ->
    
  