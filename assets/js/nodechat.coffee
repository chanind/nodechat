window.Nodechat = 
  Models: {}
  Views: {}
  Routers: {}
  Templates: {}
  init: ->
    new Nodechat.Routers.ChatRouter()
    Backbone.history.start()
    
$(document).ready -> Nodechat.init()
