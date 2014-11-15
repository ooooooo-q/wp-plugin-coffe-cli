
#

toSendSerialie = (hash)->
  str = to_serialize_hash hash
  "O:8:\"stdClass\":#{str}"

to_serialize_hash = (hash)->
  result = []
  count = 0;
  for key, val of hash
    count += 1
    result.push to_serailize key
    result.push to_serailize val
  str = result.join ';'
  "#{count}:{#{str};}"


to_serailize = (value)->
  switch typeof value
    when 'string' then "s:#{value.length}:\"#{value}\""
    when 'number' then "i:#{value}"
    when 'boolen' then if value then "b:1" else "b:0"


module.exports = toSendSerialie
