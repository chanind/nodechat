Nodechat.Routers.ChatRouter = Backbone.Router.extend
  routes:
    '': 'index'

  index: ->
    view = new Nodechat.Views.ChatIndex()
    $('#js-chat-container').html(view.render().el)