Board = require './board'

class Game
  
  constructor: ->
    @board = new Board()
    @players = []
    @turn = 0
    
  # initialize each player's position
  init: ->
    for i in [0..@players.length - 1]
      @board.init i, 0
    
  roll: ->
    dice = []
    for i in [0..1]
      dice.push Math.floor(Math.random() * 6) + 1
    return dice

module.exports = Game
