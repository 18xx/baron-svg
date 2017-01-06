class City
  def initialize(tile, center, value, spots = nil)
    @tile = tile
    @center = center
    @value = value
    @spots = spots || 1
  end

  def offset
    Tile::OFFSET * 16
  end

  def offset_x
    if off_tile?
      -offset * 1.5
    else
      -offset
    end
  end

  def offset_y
    if off_tile?
      offset
    else
      2 * -offset
    end
  end

  def to_s
    result = if @spots == 2
      %{
        <rect
          x="#{@center.x - city_radius}"
          y="#{@center.y - city_radius - city_stroke_width / 2}"
          width="#{city_radius * 2}"
          height="#{city_radius * 2 + city_stroke_width}"
          fill="black"
        />
      } +
      city_circle(Point.new(@center.x - city_radius, @center.y)) +
      city_circle(Point.new(@center.x + city_radius, @center.y))
    else
      city_circle(@center)
    end

    result + %{
      <circle
        cx="#{label_position.x}"
        cy="#{label_position.y}"
        r="#{Tile::OFFSET * 9}"
        fill="none"
        stroke="#000"
        stroke-width="#{Tile::OFFSET * 2}"
      />
      <text
        x="#{label_position.x}"
        y="#{label_position.y + Tile::OFFSET * 4}"
        text-anchor="middle"
        fill="black"
        font-size="#{Tile::OFFSET * 12}"
      >#{@value}</text>
    }
  end

  private

  def label_position
    return @label_position if @label_position

    if @tile.tile_elements.any? { |e| e.is_a? TrackToPoint } && @spots == 1
      track_locations = @tile.tile_elements.select { |e| e.is_a? TrackToPoint }.map { |t| (t.rad / Math::PI * 6).round % 12}.sort
      track_locations.push(track_locations.first + 12)
      max_index = track_locations.each_cons(2).map { |a,b| b - a }.each_with_index.max[1]
      radians = ((track_locations[max_index + 1] + track_locations[max_index]) / 2) % 12 * Math::PI / 6
      radius = Tile::OFFSET * 36

      @label_position = Point.new(
        Tile::CENTER.x + Math.cos(radians) * radius,
        Tile::CENTER.y - Math.sin(radians) * radius
      )
    else
      @label_position = Point.new(
        @center.x,
        @center.y + offset_y
      )
    end
  end

  def city_radius
    Tile::OFFSET * 20
  end

  def city_stroke_width
    Tile::OFFSET * 2
  end

  def city_circle(point)
    %{
      <circle
        cx="#{point.x}"
        cy="#{point.y}"
        r="#{city_radius}"
        fill="white"
        stroke="#000"
        stroke-width="#{city_stroke_width}"
      />
    }
  end

  def off_tile?
    (@center.y + 2 * -offset) < 0
  end
end
