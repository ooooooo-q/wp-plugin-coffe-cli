requester = require 'superagent'

serialize = require './serialize'

api_call = (action, body)->

  data =
    'action' : action
    'request' : serialize body

  console.log data

  requester.post("https://api.wordpress.org/plugins/info/1.0/")
    .type 'form'
    .send( data )
    .end (res)->
      console.log res.text

action = "query_plugins"
request =
  search : "seo"
  per_page: 10


api_call(action,request)
