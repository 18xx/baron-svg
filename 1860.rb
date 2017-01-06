require 'baron-tiles'

centre = Point.new(Tile::WIDTH / 2, Tile::HEIGHT / 2)

tiles = {}

brown = '#80461B'

[
  { num: 57, track: [
    { from: NORTH, to: CENTER },
    { from: SOUTH, to: CENTER }
  ], city: 20, rotations: (0..2), color: :yellow },
  { num: 'R', track: [
    { from: SOUTH_EAST, to: CENTER },
  ], city: 30, rotations: [0], type: 'R', color: :yellow },
  { num: 'N', track: [
    { from: NORTH, to: CENTER },
    { from: NORTH_WEST, to: CENTER },
  ], city: 30, rotations: [0], type: 'N', color: :yellow },
  { num: 'M', track: [
    { from: SOUTH_EAST, to: CENTER },
  ], city: 10, rotations: [0], type: 'M', color: :yellow },
  { num: 'V', track: [
    { from: NORTH_WEST, to: CENTER },
  ], city: 30, rotations: [0], type: 'V', color: :yellow },
  { num: 5, track: [
    { from: NORTH, to: CENTER },
    { from: NORTH_EAST, to: CENTER }
  ], city: 20, color: :yellow },
  { num: 6, track: [
    { from: NORTH, to: CENTER },
    { from: SOUTH_EAST, to: CENTER }
  ], city: 20, color: :yellow },
  { num: 115, track: [
    { from: NORTH, to: CENTER }
  ], city: 20, color: :yellow },
  { num: 746, track: [
    { from: NORTH, to: CENTER },
    { from: SOUTH, to: CENTER }
  ], city: 10, rotations: (0..2), type: 'B', color: :yellow },
  { num: 7, track: [{ from: NORTH, to: NORTH_EAST }], color: :yellow },
  { num: 8, track: [{ from: NORTH, to: SOUTH_EAST }], color: :yellow },
  { num: 9, track: [{ from: NORTH, to: SOUTH }], rotations: (0..2), color: :yellow },
  { num: 741, track: [{ from: NORTH, to: NORTH_EAST, halt: 1 }], color: :yellow },
  { num: 742, track: [{ from: NORTH, to: SOUTH_EAST, halt: 1 }], color: :yellow },
  { num: 743, track: [{ from: NORTH, to: SOUTH, halt: 1 }], rotations: (0..2), color: :yellow },
  { num: 744, track: [{ from: NORTH, to: SOUTH, halt: 2 }], rotations: (0..2), color: :yellow },
  { num: 745, track: [{ from: NORTH, to: SOUTH_EAST, halt: 2 }], color: :yellow },
  { num: 12, track: [
    { from: NORTH, to: CENTER },
    { from: NORTH_EAST, to: CENTER },
    { from: SOUTH_EAST, to: CENTER },
  ], city: 30, color: :green},
  { num: 16, track: [
    { from: NORTH, to: SOUTH_EAST },
    { from: NORTH_EAST, to: SOUTH },
  ], color: :green },
  { num: 17, track: [
    { from: NORTH, to: SOUTH_EAST },
    { from: SOUTH, to: NORTH_WEST },
  ], color: :green },
  { num: 18, track: [
    { from: NORTH, to: SOUTH },
    { from: NORTH_EAST, to: SOUTH_EAST },
  ], color: :green },
  { num: 19, track: [
    { from: NORTH, to: SOUTH_EAST },
    { from: SOUTH_WEST, to: NORTH_WEST },
  ], color: :green },
  { num: 20, track: [
    { from: NORTH, to: SOUTH },
    { from: NORTH_WEST, to: SOUTH_EAST },
  ], rotations: (0..2), color: :green },
  { num: 21, track: [
    { from: NORTH, to: SOUTH_EAST },
    { from: SOUTH_WEST, to: SOUTH },
  ], color: :green },
  { num: 22, track: [
    { from: NORTH, to: SOUTH_EAST },
    { from: NORTH_WEST, to: SOUTH_WEST },
  ], color: :green },
  { num: 205, track: [
    { from: NORTH, to: CENTER },
    { from: NORTH_EAST, to: CENTER },
    { from: SOUTH, to: CENTER },
  ], city: 30, color: :green },
  { num: 206, track: [
    { from: NORTH, to: CENTER },
    { from: SOUTH_EAST, to: CENTER },
    { from: SOUTH, to: CENTER },
  ], city: 30, color: :green },
  { num: 625, track: [
    { from: NORTH, to: NORTH_EAST },
    { from: SOUTH, to: SOUTH_EAST },
  ], color: :green },
  { num: 626, track: [
    { from: NORTH, to: NORTH_EAST },
    { from: SOUTH_WEST, to: SOUTH },
  ], color: :green },
  { num: 747, track: [
    { from: NORTH, to: NORTH_EAST, town: 10 },
  ], color: :green },
  { num: 748, track: [
    { from: NORTH, to: SOUTH_EAST, town: 10 },
  ], color: :green },
  { num: 749, track: [
    { from: NORTH, to: SOUTH, town: 10 },
  ], color: :green },
  { num: 750, track: [
    { from: NORTH, to: CENTER },
    { from: NORTH_EAST, to: CENTER },
    { from: SOUTH_EAST, to: CENTER },
  ], junction: :halt, color: :green },
  { num: 751, track: [
    { from: NORTH, to: CENTER },
    { from: SOUTH_EAST, to: CENTER },
    { from: SOUTH, to: CENTER },
  ], junction: :halt, color: :green },
  { num: 752, track: [
    { from: NORTH, to: CENTER },
    { from: NORTH_EAST, to: CENTER },
    { from: SOUTH, to: CENTER },
  ], junction: :halt, color: :green },
  { num: 753, track: [
    { from: NORTH, to: CENTER },
    { from: SOUTH_WEST, to: CENTER },
    { from: SOUTH_EAST, to: CENTER },
  ], junction: :halt, color: :green },
  { num: 754, track: [
    { from: NORTH, to: CENTER, halt: 1 },
    { from: SOUTH, to: CENTER },
    { from: SOUTH_EAST, to: CENTER },
  ], junction: 10, color: :green },
  { num: 755, track: [
    { from: NORTH, to: CENTER, halt: 1 },
    { from: SOUTH, to: CENTER },
    { from: SOUTH_WEST, to: CENTER },
  ], junction: 10, color: :green },
  { num: 756, track: [
    { from: NORTH, to: CENTER },
    { from: NORTH_EAST, to: CENTER },
  ], city: 30, color: :green },
  { num: 757, track: [
    { from: NORTH, to: CENTER },
    { from: NORTH_WEST, to: CENTER },
    { from: SOUTH, to: CENTER },
    { from: SOUTH_EAST, to: CENTER },
  ], city: 20, type: 'B', color: :green, rotations: (0..2) },
  { num: 758, track: [
    { from: NORTH, to: CENTER },
    { from: NORTH_EAST, to: CENTER },
  ], city: 50, type: 'R', color: :green, rotations: [1] },
  { num: 759, track: [
    { from: NORTH, to: CENTER },
  ], city: 30, color: :green },
  { num: 761, track: [
    { from: NORTH, to: CENTER, halt: 1 },
    { from: NORTH_EAST, to: CENTER },
    { from: SOUTH_EAST, to: CENTER },
    { from: SOUTH, to: CENTER },
  ], city: 20, type: 'M', rotations: [0], color: :green },
  { num: 761, track: [
    { from: NORTH, to: CENTER },
    { from: NORTH_EAST, to: CENTER },
    { from: SOUTH_EAST, to: CENTER },
    { from: SOUTH, to: CENTER },
  ], city: 20, type: 'B', color: :green },
  { num: 764, track: [
    { from: NORTH, to: NORTH_EAST, town: 20 },
  ], color: brown },
  { num: 765, track: [
    { from: NORTH, to: SOUTH, town: 20 },
  ], color: brown },
  { num: 766, track: [
    { from: NORTH, to: SOUTH_EAST, town: 20 },
  ], color: brown },
  { num: 767, track: [
    { from: NORTH, to: CENTER },
    { from: NORTH_EAST, to: CENTER },
    { from: SOUTH_EAST, to: CENTER },
    { from: SOUTH, to: CENTER },
  ], junction: 10, color: brown },
  { num: 768, track: [
    { from: NORTH, to: CENTER },
    { from: NORTH_WEST, to: CENTER },
    { from: SOUTH_EAST, to: CENTER },
    { from: SOUTH, to: CENTER },
  ], junction: 10, color: brown },
  { num: 769, track: [
    { from: NORTH, to: CENTER },
    { from: SOUTH_WEST, to: CENTER },
    { from: NORTH_EAST, to: CENTER },
    { from: SOUTH_EAST, to: CENTER },
  ], junction: 10, color: brown },
  { num: 770, track: [
    { from: NORTH, to: CENTER },
    { from: NORTH_WEST, to: CENTER },
    { from: SOUTH_WEST, to: CENTER },
    { from: SOUTH_EAST, to: CENTER },
    { from: SOUTH, to: CENTER },
  ], city: 30, spots: 2, color: brown, type: 'B' },
  { num: 771, track: [
    { from: NORTH, to: CENTER },
    { from: NORTH_EAST, to: CENTER },
    { from: SOUTH_EAST, to: CENTER },
  ], city: 50, color: brown },
  { num: 772, track: [
    { from: NORTH, to: CENTER },
    { from: NORTH_EAST, to: CENTER },
  ], city: 40, color: brown },
  { num: 775, track: [
    { from: NORTH, to: CENTER, halt: 1 },
    { from: NORTH_WEST, to: CENTER },
    { from: NORTH_EAST, to: CENTER },
    { from: SOUTH_WEST, to: CENTER },
    { from: SOUTH_EAST, to: CENTER },
    { from: SOUTH, to: CENTER },
  ], city: 20, spots: 2, color: brown, type: 'M' },
  { num: 776, track: [
    { from: NORTH, to: CENTER },
    { from: NORTH_EAST, to: CENTER },
    { from: SOUTH_EAST, to: CENTER },
    { from: SOUTH, to: CENTER },
  ], city: 40, spots: 2, color: brown },
  { num: 777, track: [
    { from: NORTH, to: CENTER },
  ], city: 60, color: brown },
  { num: 778, track: [
    { from: NORTH, to: SOUTH_EAST },
    { from: NORTH_WEST, to: SOUTH },
    { from: SOUTH_WEST, to: NORTH_EAST },
  ], color: brown },
  { num: 779, track: [
    { from: NORTH, to: SOUTH_EAST },
    { from: NORTH_EAST, to: SOUTH },
    { from: NORTH_WEST, to: SOUTH_WEST },
  ], color: brown },
  { num: 780, track: [
    { from: NORTH, to: SOUTH },
    { from: NORTH_EAST, to: SOUTH_EAST },
    { from: NORTH_WEST, to: SOUTH_WEST },
  ], color: brown },
  { num: 781, track: [
    { from: NORTH, to: NORTH_EAST },
    { from: SOUTH, to: SOUTH_EAST },
    { from: NORTH_WEST, to: SOUTH_WEST },
  ], color: brown },
  { num: 782, track: [
    { from: NORTH, to: CENTER, halt: 1 },
    { from: NORTH_WEST, to: CENTER },
    { from: SOUTH_WEST, to: CENTER },
    { from: SOUTH, to: CENTER },
    { from: SOUTH_EAST, to: CENTER },
  ], junction: 20, color: brown },
  { num: 783, track: [
    { from: NORTH, to: CENTER, halt: 1 },
    { from: NORTH_WEST, to: CENTER },
    { from: NORTH_EAST, to: CENTER },
    { from: SOUTH, to: CENTER },
    { from: SOUTH_EAST, to: CENTER },
  ], junction: 20, color: brown },
  { num: 784, track: [
    { from: NORTH, to: CENTER, halt: 1 },
    { from: NORTH_WEST, to: CENTER },
    { from: SOUTH_WEST, to: CENTER },
    { from: SOUTH, to: CENTER },
    { from: NORTH_EAST, to: CENTER },
  ], junction: 20, color: brown },
  { num: 785, track: [
    { from: NORTH, to: CENTER, halt: 1 },
    { from: NORTH_EAST, to: CENTER },
    { from: SOUTH_WEST, to: CENTER },
    { from: SOUTH, to: CENTER },
    { from: SOUTH_EAST, to: CENTER },
  ], junction: 20, color: brown },
  { num: 786, track: [
    { from: NORTH, to: CENTER },
    { from: NORTH_EAST, to: CENTER },
  ], city: 60, type: 'R', color: brown, rotations: [1] },
].each do |values|
  (0...6).each do |dir|
    tile = Tile.new(values[:color])

    if !values[:rotations] || values[:rotations].include?(dir)
      tile.add TileNumber.new(
        values[:num],
        dir + 1
      )

      values[:track].each do |track_values|
        track = if track_values[:to] == CENTER
          TrackToPoint.new(
            track_values[:from] - (dir * ROTATION),
          )
        else
          Track.new(
            track_values[:from] - (dir * ROTATION),
            track_values[:to] - (dir * ROTATION),
          )
        end
        tile.add track

        if track_values[:halt]
          track.midpoints(track_values[:halt]).each do |midpoint|
            tile.add Halt.new(
              midpoint[:point],
              midpoint[:label_point]
            )
          end
        end

        if track_values[:town]
          track.midpoints(1).each do |midpoint|
            tile.add Town.new(
              midpoint[:point],
              midpoint[:label_point],
              value: track_values[:town]
            )
          end
        end
      end

      tile.add City.new(
        tile,
        centre,
        values[:city],
        values[:spots]
      ) if values[:city]

      tile.add Halt.new(
        centre,
        Point.new(centre.x - Tile::OFFSET * 20, centre.y - Tile::OFFSET * 40)
      ) if values[:junction] && values[:junction] == :halt

      tile.add Town.new(
        centre,
        Point.new(centre.x - Tile::OFFSET * 20, centre.y - Tile::OFFSET * 40),
        value: values[:junction],
        color: values[:color]
      ) if values[:junction] && values[:junction].is_a?(Fixnum)

      tile.add TileType.new(
        values[:type]
      ) if values[:type]

      tiles["#{values[:num]}.#{dir + 1}"] = tile
    end
  end
end


# TODO: Green 760, 763, 788
# TODO: Brown 773, 774, 789
[
  { num: 787, track: [
    { from: SOUTH, to: Point.new(Tile::CENTER.x, Tile::HEIGHT / 4) },
  ],
  special: [
    { type: :city, value: 20, loc: Point.new(Tile::CENTER.x, Tile::HEIGHT / 4) },
    { type: :town, value: 10, loc: Point.new(Tile::CENTER.x, Tile::HEIGHT * 3 / 5) },
    { type: :halt, loc: Point.new(Tile::CENTER.x, Tile::HEIGHT * 4 / 5) },
  ],
  type: 'C',
  color: :yellow },
].each do |values|
  tile = Tile.new(values[:color])

  tile.add TileNumber.new(
    values[:num],
    0
  )

  values[:track].each do |track_values|
    track = TrackToPoint.new(
      track_values[:from],
      track_values[:to]
    )
    tile.add track
  end

  values[:special].each do |special_values|
    loc = special_values[:loc]
    case special_values[:type]
    when :city
      tile.add City.new(
        tile,
        loc,
        special_values[:value]
      )
    when :town
      tile.add Town.new(
        loc,
        Point.new(loc.x - (Tile::OFFSET * 20), loc.y),
        value: special_values[:value]
      )
    when :halt
      tile.add Halt.new(
        loc,
        Point.new(loc.x - (Tile::OFFSET * 20), loc.y)
      )
    end
  end

  tile.add TileType.new(
    values[:type]
  ) if values[:type]

  tiles["#{values[:num]}.0"] = Tile.new(values[:color])
end

tiles.each do |key,val|
  File.open("build/#{key}.svg", 'w') { |file| file.write val.to_s }
end

File.open('build/all.html', 'w') do |file|
  file.write "<html><body>#{tiles.map { |_,v| v.to_s.gsub('£', '&pound;') }.join}</body></html>"
end
