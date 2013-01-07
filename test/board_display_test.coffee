{strictEqual, ok} = require 'assert'
BoardDisplay = require '../lib/board_display'

describe 'BoardDisplay', ->
  
  it 'should have 40 spaces', ->
    strictEqual BoardDisplay.length, 40
  
  it 'each space should have all the properties', ->
    for space in BoardDisplay
      ok typeof space.name is 'string'
      ok typeof space.desc is 'string'
      ok typeof space.classes is 'string'
