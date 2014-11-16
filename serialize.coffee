PHPUnserialize = require 'php-unserialize'


class EmulatePhpSeralize

  @serialize: (hash)->
    serailzied_hash = @_serialize_hash hash
    "O:8:\"stdClass\":#{serailzied_hash}"

  @unserialize: (text) ->
    modified_to_array = text.replace /O:8:"stdClass"/g, 'a'
    PHPUnserialize.unserialize modified_to_array

  @_serialize_hash: (hash)->
    result = []
    count = 0

    for key, val of hash
      result.push @_serialize_value key
      result.push @_serialize_value val
      count += 1

    serialized_values = result.join ';'
    "#{count}:{#{serialized_values};}"


  @_serialize_value: (value) ->
    # no support  typeof obeject, decimal, array
    switch typeof value
      when 'string' then "s:#{value.length}:\"#{value}\""
      when 'number' then "i:#{value}"
      when 'boolen' then if value then "b:1" else "b:0"


module.exports = EmulatePhpSeralize
