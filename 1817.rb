require 'baron-tiles'

tiles = {}

brown = '#80461B'

[
  { num: 5, track: [
    { from: NORTH_EAST, to: CENTER },
    { from: EAST, to: CENTER }
  ], city: 20, color: :yellow },
  { num: 6, track: [
    { from: NORTH_EAST, to: CENTER },
    { from: SOUTH_EAST, to: CENTER }
  ], city: 20, color: :yellow },
  { num: 7, track: [{ from: NORTH_EAST, to: EAST }], color: :yellow },
  { num: 8, track: [{ from: NORTH_EAST, to: SOUTH_EAST }], color: :yellow },
  { num: 9, track: [{ from: NORTH_EAST, to: SOUTH_WEST }], rotations: (0..2), color: :yellow },
  { num: 57, track: [
    { from: NORTH_EAST, to: CENTER },
    { from: SOUTH_WEST, to: CENTER }
  ], city: 20, rotations: (0..2), color: :yellow },
  { num: 14, track: [
    { from: NORTH_EAST, to: CENTER },
    { from: NORTH_WEST, to: CENTER },
    { from: SOUTH_EAST, to: CENTER },
    { from: SOUTH_WEST, to: CENTER },
  ], city: 30, spots: 2, color: :green },
  { num: 15, track: [
    { from: NORTH_EAST, to: CENTER },
    { from: EAST, to: CENTER },
    { from: SOUTH_EAST, to: CENTER },
    { from: SOUTH_WEST, to: CENTER },
  ], city: 30, spots: 2, color: :green },
  { num: 54, track: [
    { from: SOUTH_WEST, to: WEST },
    { from: NORTH_WEST, to: NORTH_EAST }
  ], double_o: 60, type: 'NY', rotations: [0], color: :green },
  { num: 80, track: [
    { from: WEST, to: CENTER },
    { from: NORTH_WEST, to: CENTER },
    { from: NORTH_EAST, to: CENTER },
  ], color: :green },
  { num: 81, track: [
    { from: WEST, to: CENTER },
    { from: SOUTH_EAST, to: CENTER },
    { from: NORTH_EAST, to: CENTER },
  ], rotations: (0..1), color: :green },
  { num: 82, track: [
    { from: WEST, to: CENTER },
    { from: EAST, to: CENTER },
    { from: SOUTH_EAST, to: CENTER },
  ], color: :green },
  { num: 83, track: [
    { from: WEST, to: CENTER },
    { from: EAST, to: CENTER },
    { from: NORTH_EAST, to: CENTER },
  ], color: :green },
  { num: 592, track: [
    { from: WEST, to: CENTER },
    { from: SOUTH_EAST, to: CENTER },
    { from: NORTH_EAST, to: CENTER },
  ], city: 50, spots: 2, type: 'B', rotations: (0..1), color: :green },
  { num: 619, track: [
    { from: NORTH_EAST, to: CENTER },
    { from: EAST, to: CENTER },
    { from: SOUTH_EAST, to: CENTER },
    { from: WEST, to: CENTER },
  ], city: 30, spots: 2, color: :green },
  { num: 62, track: [
    { from: SOUTH_WEST, to: WEST },
    { from: NORTH_WEST, to: NORTH_EAST }
  ], double_o: 80, spots: 2, type: 'NY', rotations: [0], color: brown },
  { num: 63, track: [
    { from: EAST, to: WEST },
    { from: NORTH_EAST, to: SOUTH_WEST },
    { from: NORTH_WEST, to: SOUTH_EAST },
  ], city: 40, spots: 2, rotations: [0], color: brown },
  { num: 448, track: [
    { from: EAST, to: WEST },
    { from: NORTH_EAST, to: CENTER },
    { from: NORTH_WEST, to: CENTER },
  ], city: 40, spots: 2, color: brown },
  { num: 544, track: [
    { from: EAST, to: WEST },
    { from: SOUTH_EAST, to: NORTH_WEST },
  ], color: brown, rotations: (0..2) },
  { num: 545, track: [
    { from: EAST, to: WEST },
    { from: NORTH_EAST, to: CENTER },
    { from: NORTH_WEST, to: CENTER },
  ], color: brown },
  { num: 546, track: [
    { from: EAST, to: WEST },
    { from: NORTH_EAST, to: CENTER },
    { from: SOUTH_EAST, to: CENTER },
  ], color: brown },
  { num: 593, track: [
    { from: EAST, to: WEST },
    { from: NORTH_EAST, to: CENTER },
    { from: SOUTH_EAST, to: CENTER },
  ], city: 60, spots: 3, type: 'B', color: brown },
  { num: 611, track: [
    { from: EAST, to: WEST },
    { from: NORTH_EAST, to: SOUTH_WEST },
    { from: SOUTH_EAST, to: CENTER },
  ], city: 40, spots: 2, color: brown },
  { num: 'X30', track: [
    { from: SOUTH_WEST, to: CENTER },
    { from: WEST, to: CENTER },
    { from: NORTH_WEST, to: CENTER },
    { from: NORTH_EAST, to: CENTER }
  ], city: 100, spots: 4, type: 'NY', rotations: [0], color: :grey },
  { num: '597', track: [
    { from: EAST, to: WEST },
    { from: NORTH_EAST, to: SOUTH_WEST },
    { from: SOUTH_EAST, to: CENTER },
  ], city: 80, spots: 3, type: 'B', color: :grey },
  { num: 'PP-F1', track: [
    { from: NORTH_WEST, to: SOUTH_WEST },
    { from: NORTH_WEST, to: WEST },
    { from: SOUTH_WEST, to: WEST },
  ], rotations: [3], color: :grey },
  { num: 'PP-NYC', track: [
    { from: SOUTH_WEST, to: WEST, half: true },
    { from: NORTH_EAST, to: NORTH_WEST, half: true }
  ], double_o: 40, type: 'NY', rotations: [0], color: :yellow },
  { num: 'PP-Toronto', track: [
    { from: WEST, to: EAST },
    { from: SOUTH_EAST, to: CENTER }
  ], town: 40, rotations: [0], color: :grey },
  { num: 'PP-Cleveland', track: [
    { from: SOUTH_WEST, to: CENTER },
    { from: SOUTH_EAST, to: CENTER }
  ], city: 0, spots: 2, rotations: [0], color: :grey },
  { num: 'PP-B', track: [
    { from: NORTH_EAST, to: CENTER },
    { from: SOUTH_EAST, to: CENTER }
  ], city: 30, spots: 1, type: 'B', rotations: (0..1), color: :yellow },
].each do |values|
  (0...6).each do |dir|
    tile = Tile.new(values[:color])

    if !values[:rotations] || values[:rotations].include?(dir)
      tile.add TileNumber.new(
        values[:num],
        dir + 1
      ) unless values[:num].to_s.start_with?('PP')

      values[:track].each do |track_values|
        track = if track_values[:to] == CENTER
          TrackToPoint.new(
            track_values[:from] - (dir * ROTATION),
          )
        else
          Track.new(
            track_values[:from] - (dir * ROTATION),
            track_values[:to] - (dir * ROTATION),
            track_values[:half]
          )
        end
        tile.add track
      end

      tile.add City.new(
        tile,
        values[:city],
        values[:spots]
      ) if values[:city]

      tile.add Town.new(
        Point.new(Tile::WIDTH / 2, Tile::HEIGHT / 2),
        Point.new(Tile::WIDTH / 2, Tile::HEIGHT / 2)
      ) if values[:town]

      tile.add DoubleOCities.new(
        tile,
        values[:double_o],
        values[:spots]
      ) if values[:double_o]

      tile.add TileType.new(
        values[:type]
      ) if values[:type]

      tile.add(
        %{
          <g>
            <rect x="#{CENTER_X - 30}" y="#{CENTER_Y - 35}" width="20" height="20" fill="yellow" stroke="black" />
            <text text-anchor="middle" x="#{CENTER_X - 20}" y="#{CENTER_Y - 20}">20</text>
            <rect x="#{CENTER_X - 10}" y="#{CENTER_Y - 35}" width="20" height="20" fill="green" stroke="black" />
            <text text-anchor="middle" x="#{CENTER_X}" y="#{CENTER_Y - 20}">30</text>
            <rect x="#{CENTER_X + 10}" y="#{CENTER_Y - 35}" width="20" height="20" fill="brown" stroke="black" />
            <text text-anchor="middle" x="#{CENTER_X + 20}" y="#{CENTER_Y - 20}">40</text>
          </g>
          <text x="10" y="#{CENTER_Y + 30}">Toronto</text>
        }
      ) if values[:num] == 'PP-Toronto'

      tile.add(
        %{
          <g>
            <rect x="#{CENTER_X - 40}" y="#{CENTER_Y - 40}" width="20" height="20" fill="yellow" stroke="black" />
            <text text-anchor="middle" x="#{CENTER_X - 30}" y="#{CENTER_Y - 25}">30</text>
            <rect x="#{CENTER_X - 20}" y="#{CENTER_Y - 40}" width="20" height="20" fill="green" stroke="black" />
            <text text-anchor="middle" x="#{CENTER_X - 10}" y="#{CENTER_Y - 25}">40</text>
            <rect x="#{CENTER_X}" y="#{CENTER_Y - 40}" width="20" height="20" fill="brown" stroke="black" />
            <text text-anchor="middle" x="#{CENTER_X + 10}" y="#{CENTER_Y - 25}">50</text>
            <rect x="#{CENTER_X + 20}" y="#{CENTER_Y - 40}" width="20" height="20" fill="grey" stroke="black" />
            <text text-anchor="middle" x="#{CENTER_X + 30}" y="#{CENTER_Y - 25}">60</text>
          </g>
        }
      ) if values[:num] == 'PP-Cleveland'

      tiles["#{values[:num]}.#{dir + 1}"] = tile
    end
  end
end

tiles.each do |key,val|
  File.open("build/#{key}.svg", 'w') { |file| file.write val.to_s }
end

File.open('build/all.html', 'w') do |file|
  file.write "<html><body>#{tiles.map { |_,v| v.to_s.gsub('£', '&pound;') }.join}</body></html>"
end

