class City
  def initialize(center, value, spots = nil)
    @center = center
    @value = value
    @spots = spots || 1
  end

  def offset
    Tile::OFFSET * 24
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
        cx="#{@center.x + offset_x}"
        cy="#{@center.y + offset_y}"
        r="#{Tile::OFFSET * 12}"
        fill="none"
        stroke="#000"
        stroke-width="#{Tile::OFFSET * 2}"
      />
      <text
        x="#{@center.x + offset_x}"
        y="#{@center.y + Tile::OFFSET * 6 + offset_y}"
        text-anchor="middle"
        fill="black"
        font-size="#{Tile::OFFSET * 16}"
      >#{@value}</text>
    }
  end

  private

  def city_radius
    Tile::OFFSET * 24
  end

  def city_stroke_width
    Tile::OFFSET * 3
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
