{strictEqual, ok} = require 'assert'
boardDisplay = require '../lib/board_display'

describe 'game_board', ->
  
  it 'should have 40 spaces', ->
    strictEqual boardDisplay.length, 40
  
  it 'each space should have all the properties', ->
    for space in boardDisplay
      ok typeof space.name is 'string'
      ok typeof space.desc is 'string'
      ok typeof space.classes is 'string'
