{strictEqual, deepEqual, ok} = require 'assert'
Game = require '../lib/game'

game = null

describe 'game', ->
  
  before ->
    game = new Game()
    
  it 'should be able to init', ->
    game.init 2
    strictEqual game.board.pos[0], 0
    strictEqual game.board.pos[1], 0
    
  it 'should be able to roll', ->
    game.roll()
    
    strictEqual game.dice.length, 2
    
    # make sure the dice values are integers
    strictEqual game.dice[0] % 1, 0
    strictEqual game.dice[1] % 1, 0
    
    # make sure each dice value is 1-6
    ok game.dice[0] >= 1 && game.dice[0] <= 6
    ok game.dice[1] >= 1 && game.dice[1] <= 6
