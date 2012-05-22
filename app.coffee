
#
# Module dependencies.
#

express = require 'express'
routes = require './routes'
mongoose = require 'mongoose'
eco = require 'eco'
path = require 'path'

require './models'

db = mongoose.connect('mongodb://localhost/nodechat')

app = module.exports = express.createServer()

# Configuration

app.configure ->
  app.set('views', __dirname + '/views')
  app.set('view engine', 'jade')
  app.use(express.bodyParser())
  app.use(express.logger())
  app.use(require('connect-assets')(
    jsCompilers:
      eco:
        match: /\.eco$/
        compileSync: (sourcePath, source) ->
          fileName = path.basename sourcePath, '.eco'
          directoryName = (path.dirname sourcePath).replace "#{__dirname}/assets/templates", ""
          jstPath = if directoryName then "#{directoryName}/#{fileName}" else fileName
          """
          (function() {
          this.JST || (this.JST = {});
          this.JST['#{jstPath}'] = #{eco.precompile source}
          }).call(this);
          """
  ))
  app.use(express.methodOverride())
  #app.use(require('stylus').middleware({ src: __dirname + '/public' }))
  app.use(app.router)
  app.use(express.static(__dirname + '/public'))


app.configure 'development', ->
  app.use(express.errorHandler({ dumpExceptions: true, showStack: true }))


app.configure 'production', ->
  app.use(express.errorHandler())

# Routes

app.get('/', routes.index)

app.listen(3000)
console.log("Express server listening on port %d in %s mode", app.address().port, app.settings.env)