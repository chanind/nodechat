class Nodechat.Views.Comment extends Backbone.View
  
  template: JST['comment']
  
  render: ->
    $(@el).html(@template(comment: @model))
    this
