require 'point'
require 'tile'
require 'tile_number'
require 'tile_type'

require 'curve'
require 'line'

require 'city'
require 'double_o_cities'
require 'town'
require 'halt'
require 'track'
require 'track_to_center'

EAST = 0
NORTH_EAST = Math::PI * 1 / 3
NORTH_WEST = Math::PI * 2 / 3
WEST = Math::PI
SOUTH_WEST = Math::PI * 4 / 3
SOUTH_EAST = Math::PI * 5 / 3
CENTER     = :center

CENTER_X = Tile::WIDTH / 2
CENTER_Y = Tile::HEIGHT / 2

ROTATION = Math::PI / 3
