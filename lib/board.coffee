class Board
  constructor: ->
    # initialize array of players on a given space
    @spaces = []
    @spaces.push [] for i in [0..39]
    
    # initalize array of each player's position
    @pos = []
    
  init: (playerId, pos) ->
    @pos[playerId] = pos
    @spaces[pos].push playerId
    
  move: (playerId, spaces) ->
    # player's old position
    posOld = @pos[playerId]
    
    # player's new position
    pos = posOld + spaces
    pos -= 40 if pos > 39
    
    # remove player from old position
    newPlayers = [] 
    for spacesPlayerId in @spaces[posOld]
      if spacesPlayerId isnt playerId
        newPlayers.push spacesPlayerId
    @spaces[posOld] = newPlayers
    
    # move player to new position
    @pos[playerId] = pos
    @spaces[pos].push playerId

module.exports = Board
