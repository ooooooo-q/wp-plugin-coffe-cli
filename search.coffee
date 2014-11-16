request = require './request'

module.exports = (keyword, per_page, page)->

  unless keyword?
    console.log "search keyword is empty"
    return

  action = "query_plugins"
  params = getParams keyword, per_page, page

  request.send action, params, outputResult

getParams = (keyword, per_page, page)->
  per_page ?= 50
  page ?= 0

  params =
    search : keyword
    per_page: parseInt per_page, 10
    page: parseInt page, 10

outputResult = (result) ->

  console.log result.info
  console.log "#{p.slug}:\t#{p.short_description}" for key, p of result.plugins
