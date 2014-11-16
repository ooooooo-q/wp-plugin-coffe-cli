requester = require 'superagent'
PHPUnserialize = require 'php-unserialize'

serialize = require './serialize'

exports.send = (action, body, callback)->

  data =
    'action' : action
    'request' : serialize body

  requester.post("https://api.wordpress.org/plugins/info/1.0/")
    .type 'form'
    .send( data )
    .end (res)->

      modified = res.text.replace /O:8:"stdClass"/g, 'a'
      result = PHPUnserialize.unserialize modified
      callback(result)
