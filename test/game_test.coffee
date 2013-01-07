{strictEqual, deepEqual, ok} = require 'assert'
Game = require '../lib/game'

game = null

describe 'game', ->
  
  before ->
    game = new Game()
    
  it 'should be able to init', ->
    game.players = ['bill', 'joe']
    game.init()
    strictEqual game.board.pos.length, 2
    strictEqual game.board.pos[0], 0
    strictEqual game.board.pos[1], 0
    
  it 'should be able to roll', ->
    dice = game.roll()
    
    strictEqual dice.length, 2
    
    # make sure the dice values are integers
    strictEqual dice[0] % 1, 0
    strictEqual dice[1] % 1, 0
    
    # make sure each dice value is 1-6
    ok dice[0] >= 1 && dice[0] <= 6
    ok dice[1] >= 1 && dice[1] <= 6
