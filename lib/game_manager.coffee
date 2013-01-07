Game = require './game'

###
SETUP: enter number of players and choose nicks
INIT: game is being initialized
INITROLL: everyone rolls to see who goes first
PREROLL: waiting for user to roll their turn
ROLL: a user is rolling
MOVE: a user is moving the number of spaces they moved
###
STATES =
  SETUP: 'SETUP'
  INIT: 'INIT'
  INITROLL: 'INITROLL'
  PREROLL: 'PREROLL'
  ROLL: 'ROLL'
  MOVE: 'MOVE'
  
class GameManager
  constructor: ->
    @state = STATES.SETUP
    @game = new Game()
    
  addPlayer: (nick) ->
    if @state isnt STATES.SETUP
      throw new Error 'Cannot add player in current state: ' + @state
    @game.players.push nick
    
  init: ->
    if @state isnt STATES.SETUP
      throw new Error 'Cannot initialize game in current state: ' + @state
    @state = STATES.INIT
    @game.init()
    
  initRoll: ->
    if @state isnt STATES.INIT
      throw new Error 'Cannot initRoll in current state: ' + @state
    @state = STATES.INITROLL
    rolls = []
    for i in [1..@game.players.length]
      dice = @game.roll()
      rolls.push dice[0] + dice[1]
    
module.exports = GameManager
