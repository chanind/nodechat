class Nodechat.Views.Comment extends Backbone.View
  
  template: JST['comment']
  
  tagName: 'li'
  
  render: ->
    $(@el).html(@template(comment: @model))
    this
