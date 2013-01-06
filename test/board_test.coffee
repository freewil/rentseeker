{strictEqual, deepEqual} = require 'assert'
Board = require '../lib/board'

board = null

describe 'board', ->
  
  before ->
    board = new Board()
    
  it 'should be able to initialize player positions', ->
    
    # initialize player positions
    board.init 0, 2
    board.init 1, 6
    board.init 2, 6
    
    # test player 0 position
    strictEqual board.pos[0], 2
    deepEqual board.spaces[2], [0]
    
    # test player 1 position
    strictEqual board.pos[1], 6
    deepEqual board.spaces[6], [1, 2]
    
    # test player 2 position
    strictEqual board.pos[2], 6
    deepEqual board.spaces[6], [1, 2]
    
  it 'should be able to move player position', ->
    board.move 0, 12
    board.move 1, 9
    
    strictEqual board.pos[0], 14
    strictEqual board.pos[1], 15
