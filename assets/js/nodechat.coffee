window.Nodechat = 
  Models: {}
  Views: {}
  Routers: {}
  Collections: {}
  init: ->
    new Nodechat.Routers.ChatRouter()
    Backbone.history.start()
    
$(document).ready -> 
  window.socket = io.connect('http://localhost:3000')
  Nodechat.init()
