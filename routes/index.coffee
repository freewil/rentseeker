board = require '../lib/board'

module.exports =
  index: (req, res) ->
    res.render 'index', board: board
