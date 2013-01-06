board = require '../lib/board_display'

module.exports =
  index: (req, res) ->
    res.render 'index', board: board
