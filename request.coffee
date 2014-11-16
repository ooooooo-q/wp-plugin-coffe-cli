requester = require 'superagent'

serializer = require './serialize'

exports.send = (action, body, callback)->

  data =
    'action' : action
    'request' : serializer.serialize body

  requester.post("https://api.wordpress.org/plugins/info/1.0/")
    .type 'form'
    .send data
    .end (res)->
      callback( serializer.unserialize res.text )
