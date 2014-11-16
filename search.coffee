request = require './request'

module.exports = (keyword, per_page, page)->

  unless keyword?
    console.log "search keyword is empty"
    return

  per_page ?= 50
  page ?= 0

  action = "query_plugins"
  params =
    search : keyword
    per_page: parseInt per_page, 10
    page: parseInt page, 10


  request.send action, params, (result)->

    console.log result.info

    for key, p of result.plugins
      console.log "#{p.slug}:\t#{p.short_description}"
