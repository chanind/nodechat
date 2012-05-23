class Nodechat.Views.ChatIndex extends Backbone.View
  
  template: JST['chat_index']
  
  events:
    'submit #js-comment-form': 'createComment'
  
  initialize: ->
    @comments = new Nodechat.Collections.Comments()
    @comments.fetch()
    @comments.on('reset', @render, this)
    @comments.on('add', @appendComment, this)
  
  render: ->
    $(@el).html(@template())
    @comments.each(@appendComment, this)
    this
    
  appendComment: (comment) ->
    view = new Nodechat.Views.Comment(model: comment)
    @$('#js-messages').append(view.render().el)
  
  createComment: (event) ->
    event.preventDefault()
    textBox = $('#js-comment-form').find('input[type=text]')
    attrs = 
      content: textBox.val()
      author: 'Me'
    @comments.create attrs,
      wait: true
      success: -> textBox.val('')
      error: -> alert('there was an error!')
