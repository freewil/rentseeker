Board = require './board'

class Game
  constructor: ->
    @board = new Board()
    @dice = []
    
  # initialize each player's position
  init: (players) ->
    for i in [0..players]
      @board.init i, 0
    
  roll: ->
    for i in [0..1]
      @dice.push Math.floor(Math.random() * 6) + 1

module.exports = Game
